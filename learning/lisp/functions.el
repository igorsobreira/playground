
(defun multiply-by-3 (number)
  "Multiplies a number by 3"
  (interactive "p\nNumber: ")
  (message "3 * %d = %d" number (* 3 number)))


(let ((name "igor")
      (age 23))
  (message "Hello %s, you have %d years old" name age))

(let ((name 'igor)
      empty)
  (message "Hi %s, you're %s" name empty))

(if (> 10 15)
    (message "Yes!")
  (message "Nope"))

(defun which-lang (adj)
  (if (equal adj 'poweful)
      (message "Lisp")
    (message "Maybe it's Java")))

(which-lang 'powerful)
(which-lang 'slow)

(defun double (number)
  (interactive "p")
  (message "The result is %s" (* number 2)))

(defun cmp-fill (number)
  (if (> fill-column number)
      (message "It's bigger")
    (message "It's not")))

(cmp-fill 80)