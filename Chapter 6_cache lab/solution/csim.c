
#include "cachelab.h"

#include <stdio.h>
#include <stdlib.h>
#include <getopt.h>
#include <stdbool.h>

#define MAXLINE 100


void get_opt(int argc,char *argv[]);	//parse each line from trace file
void init();							//init oneSet
void deinit();							//deallocate heap memory

void do_L(void *,int);					//load operation
void do_S(void *,int);					//store operation  (do_L)
void do_M(void *,int);					//modify operatuib (do_L + do_M)

int getaddr(void *);					//get S
int gettag(void *);						//get tag

// void printSummary(int hits, int misses, int evicts);

int s;
int S;
int E;
int b;
char *trace_file;

char buf[MAXLINE];
char comd;
void *addr;
int size;

int hits,misses,evicts;
int current_time;

typedef struct {
    int *v;			//valid[E]
    int *tag;		//tag[E]
    int *time;		//time[E]
} oneSet;

oneSet *setptr;

int main(int argc, char *argv[])
{
    get_opt(argc, argv);
    init();
    
    
    FILE *f;
    if((f=fopen(trace_file,"r"))==NULL){
        printf("%s is invalid\n",trace_file);
        return 0;
    }
    
    while(fgets(buf,MAXLINE,f)!=NULL){
        sscanf(buf," %c %p,%d",&comd,&addr,&size);
        // printf("comd:%c addr:%p size:%d\n",comd,addr,size);
        switch(comd){
            case 'L':
                do_L(addr,size);
                break;
            case 'M':
                do_M(addr,size);
                break;
            case 'S':
                do_S(addr,size);
                break;
        };
    }
    printSummary(hits,misses,evicts);
    deinit();
}

void get_opt(int argc,char *argv[]){
    
    char c;
    while((c=getopt(argc,argv,"vs:E:b:t:"))!=-1){
        switch(c){
            case 's':
                s = atoi(optarg);
                break;
            case 'E':
                E = atoi(optarg);
                break;
            case 'b':
                b = atoi(optarg);
                break;
            case 't':
                trace_file = optarg;
                break;
        }
    }
}

void init(){
    
    S = 1 << s;
    setptr = (oneSet *)malloc(sizeof(oneSet) * S);
    
    for(int ind = 0; ind < S; ind++){
        
        setptr[ind].v = (int *)malloc(sizeof(int)*E);
        setptr[ind].tag = (int *)malloc(sizeof(int)*E);
        setptr[ind].time = (int *)malloc(sizeof(int)*E);
        
        for(int Eind = 0; Eind < E; Eind++){
            setptr[ind].v[Eind] = 0;
            setptr[ind].tag[Eind] = 0;
            setptr[ind].time[Eind] = 0;
        }
    }
    
    hits = 0;
    misses = 0;
    evicts = 0;
    current_time = 0;
}

void deinit(){
    for(int ind = 0; ind < S; ind++){
        free(setptr[ind].v);
        free(setptr[ind].tag);
        free(setptr[ind].time);
    }
    free(setptr);
}

void do_L(void *addr,int size){
    
    int setInd = getaddr(addr);
    int tagInd = gettag(addr);
    
    int hitTag=0;
    
    int fullTag=1;
    int empty_ind;
    
    
    oneSet *current_set = &setptr[setInd];
    
    int furthest_time=current_set->time[0];
    int furthest_ind=0;
    
    for(int Eind = 0; Eind < E; Eind++){
        if((current_set->v[Eind]==1) && current_set->tag[Eind]==tagInd){
            current_set->time[Eind]=++current_time;
            hitTag = 1;
            break;
        }
        else if(current_set->v[Eind]==0){
            fullTag = 0;
            empty_ind = Eind;
        }
        else{
            if(furthest_time>current_set->time[Eind]){
                furthest_time=current_set->time[Eind];
                furthest_ind = Eind;
            }
        }
    }
    
    if(hitTag){			//hit
        hits++;
    }else if(!fullTag){	//miss
        misses++;
        current_set->v[empty_ind] = 1;
        current_set->tag[empty_ind] = tagInd;
        current_set->time[empty_ind] = ++current_time;
    }else{				//miss+evict
        misses++;
        evicts++;
        current_set->v[furthest_ind] = 1;
        current_set->tag[furthest_ind] = tagInd;
        current_set->time[furthest_ind] = ++current_time;
    }
    
}

void do_S(void *addr,int size){
    do_L(addr,size);
}

void do_M(void *addr,int size){
    do_L(addr,size);
    do_S(addr,size);
}

int getaddr(void *addr){
    return (int)(((long)addr)>>b) & ((1<<s) -1);
}

int gettag(void *addr){
    return (int)(((long)addr)>>(b+s));
}

// void printSummary(int hits, int misses, int evicts){
// 	printf("hits:%d misses:%d evictions:%d\n",hits,misses,evicts);
// }
