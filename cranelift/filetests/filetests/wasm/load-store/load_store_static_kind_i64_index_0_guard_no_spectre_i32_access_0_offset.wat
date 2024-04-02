;;! target = "x86_64"
;;!
;;! settings = ['enable_heap_access_spectre_mitigation=false']
;;!
;;! compile = false
;;!
;;! [globals.vmctx]
;;! type = "i64"
;;! vmctx = true
;;!
;;! [globals.heap_base]
;;! type = "i64"
;;! load = { base = "vmctx", offset = 0, readonly = true }
;;!
;;! # (no heap_bound global for static heaps)
;;!
;;! [[heaps]]
;;! base = "heap_base"
;;! min_size = 0x10000
;;! offset_guard_size = 0
;;! index_type = "i64"
;;! style = { kind = "static", bound = 0x10000000 }

;; !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
;; !!! GENERATED BY 'make-load-store-tests.sh' DO NOT EDIT !!!
;; !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

(module
  (memory i64 1)

  (func (export "do_store") (param i64 i32)
    local.get 0
    local.get 1
    i32.store offset=0)

  (func (export "do_load") (param i64) (result i32)
    local.get 0
    i32.load offset=0))

;; function u0:0(i64, i32, i64 vmctx) fast {
;;     gv0 = vmctx
;;     gv1 = load.i64 notrap aligned readonly gv0
;;
;;                                 block0(v0: i64, v1: i32, v2: i64):
;; @0040                               v3 = iconst.i64 0x0fff_fffc
;; @0040                               v4 = icmp ugt v0, v3  ; v3 = 0x0fff_fffc
;; @0040                               trapnz v4, heap_oob
;; @0040                               v5 = global_value.i64 gv1
;; @0040                               v6 = iadd v5, v0
;; @0040                               store little heap v1, v6
;; @0043                               jump block1
;;
;;                                 block1:
;; @0043                               return
;; }
;;
;; function u0:1(i64, i64 vmctx) -> i32 fast {
;;     gv0 = vmctx
;;     gv1 = load.i64 notrap aligned readonly gv0
;;
;;                                 block0(v0: i64, v1: i64):
;; @0048                               v3 = iconst.i64 0x0fff_fffc
;; @0048                               v4 = icmp ugt v0, v3  ; v3 = 0x0fff_fffc
;; @0048                               trapnz v4, heap_oob
;; @0048                               v5 = global_value.i64 gv1
;; @0048                               v6 = iadd v5, v0
;; @0048                               v7 = load.i32 little heap v6
;; @004b                               jump block1(v7)
;;
;;                                 block1(v2: i32):
;; @004b                               return v2
;; }
