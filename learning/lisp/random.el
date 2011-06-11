;; learnin lisp

(substring "igor sobreira" 5 7)
(+ 2 fill-column)
(concat "igor tem " (number-to-string 23) " anos")

(message "hello lisp")
(message "My name is %s" (buffer-name))
(message "I, %s have %d years old"
	 "igor" (- 30 7))
(message "%s e %s se %s"
	 (concat "ig" "or")
	 (substring "joh borges" 0 3)
	 (substring "amam ou adeiam?" 0 4))

(set 'names '(igor joh))

(set 'pessoa 'nome)
(set pessoa "igor")
(message nome)

(setq sports '(windsurf surf kitesurf)
      langs '(python lisp lua))

(setq even 0)
(setq even (+ even 2))

(setq hello (message "hello igor"))
hello

(self-insert-command 2)

(buffer-name)
(buffer-file-name)
(buffer-size)
(current-buffer)

(switch-to-buffer (other-buffer))
