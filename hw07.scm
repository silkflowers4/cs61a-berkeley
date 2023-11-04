(define (filter-lst fn lst)

    (cond
          ((null? lst ) nil)
          ((fn( car lst ))
          (cons(car lst) (filter-lst fn (cdr lst))))

      (else(filter-lst fn (cdr lst)))

    )
)
;def filter(fn,lst):
;if lst is Link.empty: return Link.empty
;if fn(lst.first): return Link(lst.first,filter(fn,lst.rest))
; else: return filter(fn,lst.rest)


; ;; Tests
(define (even? x) (= (modulo x 2) 0))

(filter-lst even? '(0 1 1 2 3 5 8))

; expect (0 2 8)
(define (interleave first second)
    (cond ((null? first ) second)
          ((null? second ) first)
          (else (cons (car first) 
                      (cons (car second )
                            (interleave (cdr first)(cdr second))))))
    )

;if first.rest is Link.empty: return second
;if second.rest is Link.empty: return first
; return Link( first.first,Link(second.first,interleave(first.rest,second.rest)
(interleave (list 1 5 3) (list 2 4 6))

; expect (1 2 5 4 3 6)
(interleave (list 1 3 5) nil)

; expect (1 3 5)
(interleave (list 1 3 5) (list 2 4))

; expect (1 2 3 4 5)
(define (accumulate combiner start n term)
  (if (= 0 n ) start
      ( accumulate combiner (combiner start (term n)) (- n 1) term)
          )

)

(define (without-duplicates lst)
    (if (null? lst ) nil

    (cons (car lst ) (without-duplicates (filter-lst (lambda ( x ) (not (= ( car lst ) x ))) (cdr lst)))

        )
    )
)
;(5 5 4 3 2 1 ) -> (5 4 3 2 1 )
    
