test
0x08048c7f <+0>:	push   %ebp
   0x08048c80 <+1>:	mov    %esp,%ebp
   0x08048c82 <+3>:	push   %ebx
=> 0x08048c83 <+4>:	sub    $0x24,%esp
   0x08048c86 <+7>:	call   0x8048b30 <uniqueval>
   0x08048c8b <+12>:	mov    %eax,-0xc(%ebp)
   0x08048c8e <+15>:	call   0x8048c04 <getbuf>
   0x08048c93 <+20>:	mov    %eax,%ebx
   0x08048c95 <+22>:	call   0x8048b30 <uniqueval>
   0x08048c9a <+27>:	mov    -0xc(%ebp),%edx
   0x08048c9d <+30>:	cmp    %edx,%eax
   0x08048c9f <+32>:	je     0x8048caf <test+48>
   0x08048ca1 <+34>:	movl   $0x804a0a8,(%esp)
   0x08048ca8 <+41>:	call   0x8048940 <puts@plt>
   0x08048cad <+46>:	jmp    0x8048ce5 <test+102>
   0x08048caf <+48>:	cmp    0x804c1e4,%ebx
   0x08048cb5 <+54>:	jne    0x8048cd5 <test+86>
   0x08048cb7 <+56>:	mov    %ebx,0x4(%esp)
   0x08048cbb <+60>:	movl   $0x8049f13,(%esp)
   0x08048cc2 <+67>:	call   0x80488e0 <printf@plt>
   0x08048cc7 <+72>:	movl   $0x3,(%esp)
   0x08048cce <+79>:	call   0x80490e4 <validate>
   0x08048cd3 <+84>: jmp    0x8048ce5 <test+102>
   0x08048cd5 <+86>: mov    %ebx,0x4(%esp)
   0x08048cd9 <+90>: movl   $0x8049f30,(%esp)
   0x08048ce0 <+97>: call   0x80488e0 <printf@plt>
   0x08048ce5 <+102>:   add    $0x24,%esp
   0x08048ce8 <+105>:   pop    %ebx
   0x08048ce9 <+106>:   pop    %ebp
   0x08048cea <+107>:   ret    

Dump of assembler code for function getbuf:
   0x08048c04 <+0>:  push   %ebp
   0x08048c05 <+1>:  mov    %esp,%ebp
   0x08048c07 <+3>:  sub    $0x38,%esp
   0x08048c0a <+6>:  lea    -0x28(%ebp),%eax
   0x08048c0d <+9>:  mov    %eax,(%esp)
   0x08048c10 <+12>: call   0x8048b4a <Gets>
   0x08048c15 <+17>: mov    $0x1,%eax
   0x08048c1a <+22>: leave  
   0x08048c1b <+23>: ret  

Dump of assembler code for function Gets:
   0x08048b4a <+0>:  push   %ebp
   0x08048b4b <+1>:  mov    %esp,%ebp
   0x08048b4d <+3>:  push   %edi
   0x08048b4e <+4>:  push   %esi
   0x08048b4f <+5>:  push   %ebx
   0x08048b50 <+6>:  sub    $0x2c,%esp
   0x08048b53 <+9>:  movl   $0x0,0x804c1f0
   0x08048b5d <+19>: mov    0x8(%ebp),%ebx
   0x08048b60 <+22>: mov    $0x804a214,%esi
   0x08048b65 <+27>: jmp    0x8048bb4 <Gets+106>
   0x08048b67 <+29>: mov    %al,-0x28(%ebp)
   0x08048b6a <+32>: mov    %al,(%ebx)
   0x08048b6c <+34>: mov    0x804c1f0,%eax
   0x08048b71 <+39>: cmp    $0x3ff,%eax
   0x08048b76 <+44>: jg     0x8048bb1 <Gets+103>
   0x08048b78 <+46>: lea    (%eax,%eax,2),%edx
   0x08048b7b <+49>: movzbl -0x28(%ebp),%ecx
   0x08048b7f <+53>: shr    $0x4,%cl
   0x08048b82 <+56>: movsbl %cl,%edi
   0x08048b85 <+59>: movzbl (%esi,%edi,1),%edi
   0x08048b89 <+63>: mov    %edi,%ecx
   0x08048b8b <+65>: mov    %cl,0x804c200(%edx)
   0x08048b91 <+71>: movzbl -0x28(%ebp),%ecx
   0x08048b95 <+75>: and    $0xf,%ecx
   0x08048b98 <+78>: movzbl (%esi,%ecx,1),%ecx
   0x08048b9c <+82>: mov    %cl,0x804c201(%edx)
   0x08048ba2 <+88>: movb   $0x20,0x804c202(%edx)
   0x08048ba9 <+95>: add    $0x1,%eax
   0x08048bac <+98>: mov    %eax,0x804c1f0
   0x08048bb1 <+103>:   add    $0x1,%ebx
   0x08048bb4 <+106>:   mov    0x804c1e0,%eax
   0x08048bb9 <+111>:   mov    %eax,(%esp)
   0x08048bbc <+114>:   call   0x8048860 <_IO_getc@plt>
   0x08048bc1 <+119>:   cmp    $0xffffffff,%eax
   0x08048bc4 <+122>:   je     0x8048bcb <Gets+129>
   0x08048bc6 <+124>:   cmp    $0xa,%eax
   0x08048bc9 <+127>:   jne    0x8048b67 <Gets+29>
   0x08048bcb <+129>:   movb   $0x0,(%ebx)
   0x08048bce <+132>:   mov    0x804c1f0,%eax
   0x08048bd3 <+137>:   movb   $0x0,0x804c200(%eax,%eax,2)
   0x08048bdb <+145>:   mov    0x8(%ebp),%eax
   0x08048bde <+148>:   add    $0x2c,%esp
   0x08048be1 <+151>:   pop    %ebx
   0x08048be2 <+152>:   pop    %esi
   0x08048be3 <+153>:   pop    %edi
   0x08048be4 <+154>:   pop    %ebp
   0x08048be5 <+155>:   ret    

Dump of assembler code for function smoke:
   0x080490ba <+0>:  push   %ebp
   0x080490bb <+1>:  mov    %esp,%ebp
   0x080490bd <+3>:  sub    $0x18,%esp
   0x080490c0 <+6>:  movl   $0x8049fb5,(%esp)
   0x080490c7 <+13>: call   0x8048940 <puts@plt>
   0x080490cc <+18>: movl   $0x0,(%esp)
   0x080490d3 <+25>: call   0x80490e4 <validate>
   0x080490d8 <+30>: movl   $0x0,(%esp)
   0x080490df <+37>: call   0x8048990 <exit@plt>

Dump of assembler code for function fizz:
   0x0804906f <+0>:  push   %ebp
   0x08049070 <+1>:  mov    %esp,%ebp
   0x08049072 <+3>:  sub    $0x18,%esp
   0x08049075 <+6>:  mov    0x8(%ebp),%eax
   0x08049078 <+9>:  cmp    0x804c1e4,%eax
   0x0804907e <+15>: jne    0x804909e <fizz+47>
   0x08049080 <+17>: mov    %eax,0x4(%esp)
   0x08049084 <+21>: movl   $0x8049f97,(%esp)
   0x0804908b <+28>: call   0x80488e0 <printf@plt>
   0x08049090 <+33>: movl   $0x1,(%esp)
   0x08049097 <+40>: call   0x80490e4 <validate>
   0x0804909c <+45>: jmp    0x80490ae <fizz+63>
   0x0804909e <+47>: mov    %eax,0x4(%esp)
   0x080490a2 <+51>: movl   $0x804a1b8,(%esp)
   0x080490a9 <+58>: call   0x80488e0 <printf@plt>
   0x080490ae <+63>: movl   $0x0,(%esp)
   0x080490b5 <+70>: call   0x8048990 <exit@plt>


Dump of assembler code for function bang:
   0x08049022 <+0>:  push   %ebp
   0x08049023 <+1>:  mov    %esp,%ebp
   0x08049025 <+3>:  sub    $0x18,%esp
   0x08049028 <+6>:  mov    0x804c1ec,%eax
   0x0804902d <+11>: cmp    0x804c1e4,%eax
   0x08049033 <+17>: jne    0x8049053 <bang+49>
   0x08049035 <+19>: mov    %eax,0x4(%esp)
   0x08049039 <+23>: movl   $0x804a190,(%esp)
   0x08049040 <+30>: call   0x80488e0 <printf@plt>
   0x08049045 <+35>: movl   $0x2,(%esp)
   0x0804904c <+42>: call   0x80490e4 <validate>
   0x08049051 <+47>: jmp    0x8049063 <bang+65>
   0x08049053 <+49>: mov    %eax,0x4(%esp)
   0x08049057 <+53>: movl   $0x8049f79,(%esp)
   0x0804905e <+60>: call   0x80488e0 <printf@plt>
   0x08049063 <+65>: movl   $0x0,(%esp)
   0x0804906a <+72>: call   0x8048990 <exit@plt>

   Dump of assembler code for function testn:
   0x08048c1c <+0>:  push   %ebp
   0x08048c1d <+1>:  mov    %esp,%ebp
   0x08048c1f <+3>:  sub    $0x28,%esp
   0x08048c22 <+6>:  movl   $0xdeadbeef,-0xc(%ebp)
   0x08048c29 <+13>: call   0x8048be6 <getbufn>
   0x08048c2e <+18>: mov    -0xc(%ebp),%edx
   0x08048c31 <+21>: cmp    $0xdeadbeef,%edx
   0x08048c37 <+27>: je     0x8048c47 <testn+43>
   0x08048c39 <+29>: movl   $0x804a0a8,(%esp)
   0x08048c40 <+36>: call   0x8048940 <puts@plt>
   0x08048c45 <+41>: jmp    0x8048c7d <testn+97>
   0x08048c47 <+43>: cmp    0x804c1e4,%eax
   0x08048c4d <+49>: jne    0x8048c6d <testn+81>
   0x08048c4f <+51>: mov    %eax,0x4(%esp)
   0x08048c53 <+55>: movl   $0x804a0d4,(%esp)
   0x08048c5a <+62>: call   0x80488e0 <printf@plt>
   0x08048c5f <+67>: movl   $0x4,(%esp)
   0x08048c66 <+74>: call   0x80490e4 <validate>
   0x08048c6b <+79>: jmp    0x8048c7d <testn+97>
   0x08048c6d <+81>: mov    %eax,0x4(%esp)
   0x08048c71 <+85>: movl   $0x8049ef7,(%esp)
   0x08048c78 <+92>: call   0x80488e0 <printf@plt>
   0x08048c7d <+97>: leave  
   0x08048c7e <+98>: ret 

Dump of assembler code for function getbufn:
   0x08048be6 <+0>:  push   %ebp
   0x08048be7 <+1>:  mov    %esp,%ebp
   0x08048be9 <+3>:  sub    $0x218,%esp
   0x08048bef <+9>:  lea    -0x208(%ebp),%eax
=> 0x08048bf5 <+15>: mov    %eax,(%esp)
   0x08048bf8 <+18>: call   0x8048b4a <Gets>
   0x08048bfd <+23>: mov    $0x1,%eax
   0x08048c02 <+28>: leave  
   0x08048c03 <+29>: ret 