;;! target = "x86_64"

(module
    (func (result i64)
        i32.const 1
        i64.extend_i32_u
        block
        end
    )
)
;;    0:	 55                   	push	rbp
;;    1:	 4889e5               	mov	rbp, rsp
;;    4:	 4883ec08             	sub	rsp, 8
;;    8:	 4c893424             	mov	qword ptr [rsp], r14
;;    c:	 b801000000           	mov	eax, 1
;;   11:	 8bc0                 	mov	eax, eax
;;   13:	 50                   	push	rax
;;   14:	 58                   	pop	rax
;;   15:	 4883c408             	add	rsp, 8
;;   19:	 5d                   	pop	rbp
;;   1a:	 c3                   	ret	
