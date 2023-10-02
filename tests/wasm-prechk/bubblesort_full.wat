(module
  (type (;0;) (func (param i32 i32) (result i32)))
  (type (;1;) (func (param i32)))
  (type (;2;) (func))
  (type (;3;) (func (result i32)))
  (type (;4;) (func (param i32 i32)))
  (type (;5;) (func (param i32) (result i32)))
  (type (;6;) (func (param i32 i32) (pre
                      (eq (i32 1) (i32.lt_u (local 0) (i32 65504)))
                      (eq (i32 1) (i32.lt_u (local 1) (i32 65504)))
                      (eq (i32 1) (i32.lt_u (i32.add (local 0) (i32.mul (local 1) (i32 8))) (i32 65504))))))
  (type (;7;) (func (pre
                      (eq (i32 1) (i32.lt_u (local 0) (i32 65504)))
                      (eq (i32 1) (i32.lt_u (local 4) (i32 65504)))
                      (eq (i32 1) (i32.lt_u (i32.add (local 0) (i32.mul (local 4) (i32 8))) (i32 65504)))
                      (eq (local 1) (i32.sub (local 4) (local 3)))
                      (eq (i32 1) (i32.ge_s (local 1) (i32 0)))
                      (eq (i32 1) (i32.le_u (local 3) (local 4))))))
  (type (;8;) (func (pre
                      (eq (i32 1) (i32.lt_u (local 0) (i32 65504)))
                      (eq (i32 1) (i32.lt_u (local 4) (i32 65504)))
                      (eq (i32 1) (i32.lt_u (i32.add (local 0) (i32.mul (local 4) (i32 8))) (i32 65504)))
                      (eq (i32.add (i32 1) (local 1)) (i32.sub (local 4) (local 3)))
                      ;;(eq (i32 1) (i32.ge_s (local 1) (i32 0)))
                      (eq (i32 1) (i32.lt_u (local 3) (local 4)))
                      (eq (i32 1) (i32.le_u (local 2) (local 5)))
                      (if (eq (i32 1) (i32.gt_s (local 1) (i32 0)))
                          (eq (local 5) (local 1))
                          (eq (local 5) (i32 0))))))
  (import "wasi_snapshot_preview1" "args_sizes_get" (func $__wasi_args_sizes_get (type 0)))
  (import "wasi_snapshot_preview1" "args_get" (func $__wasi_args_get (type 0)))
  (import "wasi_snapshot_preview1" "proc_exit" (func $__wasi_proc_exit (type 1)))
  (func $__wasm_call_ctors (type 2)
    nop)
  (func $bubblesort (type 6) (param i32 i32)
    (local i32 i32 i32 i32 i32 i32 i32 i32)
    local.get 1
    i32.const 0
    local.get 1
    i32.const 0
    i32.gt_s
    select
    local.set 4
    loop (type 7)  ;; label = @1
      local.get 3
      local.get 4
      i32.eq
      i32.eqz
      if (type 7)  ;; label = @2
        local.get 1
        i32.const 1
        i32.sub
        local.tee 1
        i32.const 0
        local.get 1
        i32.const 0
        i32.gt_s
        select
        local.set 5
        i32.const 0
        local.set 2
        loop (type 8)  ;; label = @3
          local.get 2
          local.get 5
          i32.ne
          if (type 8)  ;; label = @4
            local.get 0
            local.get 2
            i32.const 2
            i32.shl
            i32.add
            local.tee 6
            i32.load_prechk
            local.tee 7
            local.get 0
            local.get 2
            i32.const 1
            i32.add
            local.tee 2
            i32.const 2
            i32.shl
            i32.add
            local.tee 8
            i32.load_prechk
            local.tee 9
            i32.le_s
            br_if 1 (;@3;)
            local.get 6
            local.get 9
            i32.store_prechk
            local.get 8
            local.get 7
            i32.store_prechk
            br 1 (;@3;)
          end
        end
        local.get 3
        i32.const 1
        i32.add
        local.set 3
        br 1 (;@1;)
      end
    end)
  (func $main (type 0) (param i32 i32) (result i32)
    i32.const 5
    i32.const 5
    call $bubblesort
    i32.const 5
    i32.load)
  (func $_start (type 2)
    call $__wasm_call_ctors
    call $__original_main
    call $exit
    unreachable)
  (func $main.1 (type 0) (param i32 i32) (result i32)
    local.get 0
    local.get 1
    call $main)
  (func $__main_void (type 3) (result i32)
    (local i32 i32 i32 i32)
    global.get 0
    i32.const 16
    i32.sub
    local.tee 0
    global.set 0
    block  ;; label = @1
      local.get 0
      local.tee 1
      i32.const 12
      i32.add
      local.get 0
      i32.const 8
      i32.add
      call $__wasi_args_sizes_get
      i32.eqz
      if  ;; label = @2
        local.get 0
        local.get 1
        i32.load offset=12
        i32.const 2
        i32.shl
        local.tee 3
        i32.const 19
        i32.add
        i32.const -16
        i32.and
        i32.sub
        local.tee 0
        local.tee 2
        global.set 0
        local.get 2
        local.get 1
        i32.load offset=8
        i32.const 15
        i32.add
        i32.const -16
        i32.and
        i32.sub
        local.tee 2
        global.set 0
        local.get 0
        local.get 3
        i32.add
        i32.const 0
        i32.store
        local.get 0
        local.get 2
        call $__wasi_args_get
        br_if 1 (;@1;)
        local.get 1
        i32.load offset=12
        local.get 0
        call $main.1
        local.set 0
        local.get 1
        i32.const 16
        i32.add
        global.set 0
        local.get 0
        return
      end
      i32.const 71
      call $__wasi_proc_exit
      unreachable
    end
    i32.const 71
    call $__wasi_proc_exit
    unreachable)
  (func $__original_main (type 3) (result i32)
    call $__main_void)
  (func $dummy (type 2)
    nop)
  (func $libc_exit_fini (type 2)
    call $dummy)
  (func $exit (type 1) (param i32)
    call $dummy
    call $libc_exit_fini
    call $dummy
    local.get 0
    call $_Exit
    unreachable)
  (func $_Exit (type 1) (param i32)
    local.get 0
    call $__wasi_proc_exit
    unreachable)
  (func $stackSave (type 3) (result i32)
    global.get 0)
  (func $stackRestore (type 1) (param i32)
    local.get 0
    global.set 0)
  (func $stackAlloc (type 5) (param i32) (result i32)
    (local i32)
    global.get 0
    local.get 0
    i32.sub
    i32.const -16
    i32.and
    local.tee 1
    global.set 0
    local.get 1)
  (func $__errno_location (type 3) (result i32)
    i32.const 1024)
  (table (;0;) 2 2 funcref)
  (memory (;0;) 256 256)
  (global (;0;) (mut i32) (i32.const 5243920))
  (export "memory" (memory 0))
  (export "_start" (func $_start))
  (export "__indirect_function_table" (table 0))
  (export "__errno_location" (func $__errno_location))
  (export "stackSave" (func $stackSave))
  (export "stackRestore" (func $stackRestore))
  (export "stackAlloc" (func $stackAlloc))
  (elem (;0;) (i32.const 1) func $__wasm_call_ctors))