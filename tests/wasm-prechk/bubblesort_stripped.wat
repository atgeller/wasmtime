(module
  (type (;0;) (func (param i32 i32) (pre
                      (eq (i32 1) (i32.lt_u (local 0) (i32 6550400)))
                      (eq (i32 1) (i32.lt_u (local 1) (i32 6550400)))
                      (eq (i32 1) (i32.lt_u (i32.add (local 0) (i32.mul (local 1) (i32 8))) (i32 6550400))))))
  (type (;1;) (func (pre
                      (eq (i32 1) (i32.lt_u (local 0) (i32 6550400)))
                      (eq (i32 1) (i32.lt_u (local 4) (i32 6550400)))
                      (eq (i32 1) (i32.lt_u (i32.add (local 0) (i32.mul (local 4) (i32 8))) (i32 6550400)))
                      (eq (local 1) (i32.sub (local 4) (local 3)))
                      (eq (i32 1) (i32.ge_s (local 1) (i32 0)))
                      (eq (i32 1) (i32.le_u (local 3) (local 4))))))
  (type (;2;) (func (pre
                      (eq (i32 1) (i32.lt_u (local 0) (i32 6550400)))
                      (eq (i32 1) (i32.lt_u (local 4) (i32 6550400)))
                      (eq (i32 1) (i32.lt_u (i32.add (local 0) (i32.mul (local 4) (i32 8))) (i32 6550400)))
                      (eq (i32.add (i32 1) (local 1)) (i32.sub (local 4) (local 3)))
                      ;;(eq (i32 1) (i32.ge_s (local 1) (i32 0)))
                      (eq (i32 1) (i32.lt_u (local 3) (local 4)))
                      (eq (i32 1) (i32.le_u (local 2) (local 5)))
                      (if (eq (i32 1) (i32.gt_s (local 1) (i32 0)))
                          (eq (local 5) (local 1))
                          (eq (local 5) (i32 0))))))
  (type (;3;) (func (param i32) (pre
                      (eq (i32 1) (i32.lt_u (local 0) (i32 6550400)))
                      (eq (i32 1) (i32.lt_u (i32.mul (local 0) (i32 8)) (i32 6550400))))))
  (type (;4;) (func))
  (type (;5;) (func (pre
                      (eq (i32 1) (i32.lt_u (i32.mul (local 0) (i32 8)) (i32 6550400)))
                      (eq (i32 1) (i32.lt_u (local 0) (i32 6550400)))
                      (eq (i32 1) (i32.le_u (local 2) (local 0))))
                    (post
                      (eq (i32 1) (i32.lt_u (local 0) (i32 6550400)))
                      (eq (i32 1) (i32.lt_u (i32.mul (local 0) (i32 8)) (i32 6550400))))))

  (func $bubblesort (type 0) (param i32 i32)
    (local i32 i32 i32 i32 i32 i32 i32 i32)
    local.get 1
    i32.const 0
    local.get 1
    i32.const 0
    i32.gt_s
    select
    local.set 4
    loop (type 1)  ;; label = @1
      local.get 3
      local.get 4
      i32.eq
      i32.eqz
      if (type 1)  ;; label = @2
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
        loop (type 2)  ;; label = @3
          local.get 2
          local.get 5
          i32.ne
          if (type 2)  ;; label = @4
            local.get 0
            local.get 2
            i32.const 2
            i32.shl
            i32.add
            local.tee 6
            i32.load
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
            i32.load
            local.tee 9
            i32.le_s
            br_if 1 (;@3;)
            local.get 6
            local.get 9
            i32.store
            local.get 8
            local.get 7
            i32.store
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

  (func $do_bsort (type 3) (param i32)
    (local i32 i32)
    local.get 0
    local.set 1                                     ;; j = size
    block (type 5) ;; label = @1
      loop (type 5) ;; label = @2
        local.get 2
        local.get 0
        i32.ge_s
        br_if 1 (;@1;)                              ;; while (i < size)
        local.get 2
        local.get 1
        i32.store                                   ;; array[i] = j
        local.get 1
        i32.const 1
        i32.sub
        local.set 1                                 ;; j--
        local.get 2
        i32.const 8
        i32.add
        local.set 2                                 ;; i++
        br 0 (;@2;)
      end
    end
    i32.const 0
    local.get 0
    call $bubblesort)                               ;; bubble_sort(size)

  (func $_start (type 4)
    i32.const 50000
    call $do_bsort)

  (export "_start" (func $_start))
  (memory (;0;) 100))