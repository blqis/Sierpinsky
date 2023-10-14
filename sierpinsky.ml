open Mips
open Mips_helper

let () =
  print_asm Stdlib.stdout
    { text =
          [ Label "main"
          ;  Li (T0, 1) 
          ; Li (T1, 2147483648)

          ;  Label "while_1" 
          ;  Bgtu (T0, T1, "done")
          ;  Move (T2, T0) ; Blez (T2, "newline")

          ;  Label "while_2" 
          ;  Andi (T3, T2, 1) ; Beqz (T3, "else")
          ]
          @ print_str "hash" 
          @ [ B "ndiv"
          ;  Label "else"
          ]
          @ print_str "space" 
          @ [ Label "ndiv" 
          ;  Srl (T2, T2, 1)
          ;  Label "newline" 
          ;  Bgtz (T2, "while_2")
          ]
          @ print_str "nl"
          @ [ Sll (T4, T0, 1) ; Xor (T0, T4, T0)

          ;  Label "done" 
          ;  Bleu (T0, T1, "while_1")
          ;  Jr RA
          ]
    ; data = [
        ("nl", Asciiz "\\n")
      ; ("hash", Asciiz "#")
      ; ("space", Asciiz " ")
      ]
    }
