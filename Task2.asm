;NAME: TAJUDEEN M OJO
;SID: 13146289

; This section contains all the data this program uses such as strings and numerical constants
section	.data

; Strings for the game introduction and player messages
intro db "Welcome to Same or Different game, PLEASE ANSWER EACH QUSTION IN UPPERCASE  S/D", 10 
introLen equ $-intro 
correctMsg db "Correct! ", 10 
correctMsglen equ $-correctMsg 
incorrectMsg db "Incorrect ", 10 
incorrectMsglen equ $-incorrectMsg 
p1Msg db "Player 1 :  ",  
p1Msglen equ $-p1Msg
p2Msg db "Player 2 :  ",  
p2Msglen equ $-p2Msg

; Final score messages
finalScoreMsg_p1 db "/4 is Player 1  final score ", 10 
finalScoreMsg_p1len equ $-finalScoreMsg_p1
finalScoreMsg_p2 db "/4 is Player 2  final score ", 10 
finalScoreMsg_p2len equ $-finalScoreMsg_p2

; End of game message
endGameMsg db "This is the end of the game between the two players. Thanks for playing, Player 1 and Player 2!", 10
endGameMsgLen equ $-endGameMsg

; Variables to keep track of the players' scores  
p1Score db 0 
p2Score db 0 
printP1Score db 0
printP2Score db 0

; Game Questions and it's Support information
q1 db "Player 1's QUESTION 1: The number of sides on a square and the number of sides on a rectangle. (S/D)", 10 
q1Len equ $-q1 
supportInfo1 db "Both a square and a rectangle have four sides.", 0
supportInfo1Len equ $-supportInfo1

q2 db "Player 2's QUESTION 1: The number of months in a year and the number of days in a week. (S/D)", 10 
q2Len equ $-q2 
supportInfo2 db "There are 12 months in a year and 7 days in a week.", 0
supportInfo2Len equ $-supportInfo2

q3 db "Player 1's QUESTION 2:The freezing point of water in Fahrenheit and the freezing point of water in Celsius. (S/D)", 10 
q3Len equ $-q3
supportInfo3 db "The freezing point of water is 0 degrees Celsius and 32 degrees Fahrenheit.", 0
supportInfo3Len equ $-supportInfo3 

q4 db "Player 2's QUESTION 2: The capital of France and the capital of Italy. (S/D)", 10 
q4Len equ $-q4 
supportInfo4 db "The capital of France is Paris and the capital of Italy is Rome.", 0
supportInfo4Len equ $-supportInfo4

q5 db "Player 1's QUESTION 3: The number of years in a decade and the number of years in a century. (S/D)", 10 
q5Len equ $-q5 
supportInfo5 db "A decade consists of 10 years, while a century consists of 100 years.", 0
supportInfo5Len equ $-supportInfo5

q6 db "Player 2's QUESTION 3: The number of legs on a spider and the number of legs on an octopus. (S/D)", 10 
q6Len equ $-q6 
supportInfo6 db "A spider has 8 legs and an octopus also has 8 legs (or arms).", 0
supportInfo6Len equ $-supportInfo6

q7 db "Player 1's QUESTION 4: The number of vowels in the English alphabet and the number of vowels in the Spanish alphabet. (S/D)", 10
q7Len equ $-q7 
supportInfo7 db "Both the English and Spanish alphabets have 5 vowels (a, e, i, o, u).", 0
supportInfo7Len equ $-supportInfo7

q8 db "Player 2's QUESTION 4: The number of planets in our solar system and the number of continents on Earth. (S/D)", 10 
q8Len equ $-q8
supportInfo8 db "There are 8 planets in our solar system and 7 continents on Earth.", 0
supportInfo8Len equ $-supportInfo8

newline db 10 

;The array we are using to store the correct answers for the guessing game
global Answerslist
Answerslist:  
  
  dq  'S' 
  dq  'D' 
  dq  'D' 
  dq  'D' 
  dq  'D' 
  dq  'S' 
  dq  'S' 
  dq  'D' 
   
Currentletter: 
  dq  0 
   
section .bss
; This section is used for declaring variables
userGuess resb 1  

section	.text
; This section contains the actual code of the program
   global _start  
    
_start:	
; The start of the program. It displays the intro and starts the game loop
call displayintro
call newLine
mov  rax,10      
mov  rbx,0      
mov  rcx, Answerslist  

top:  
; The main game loop
; This loop handles the first question for player 1. 
; It displays the question, gets the player's answer, checks if it's correct, and displays the supporting information
  mov  rbx, [rcx] 
  mov [Currentletter],rbx 
  push rax 
  push rcx 
  
  mov  edx,q1Len     
  mov  ecx, q1  
  mov  ebx, 1     
  mov  eax, 4     
  int  0x80      
  
  mov  edx, p1Msglen
  mov  ecx, p1Msg
  mov  ebx, 1
  mov  eax, 4
  int  0x80
  call check_player1 
  mov ecx, supportInfo1 
  mov edx, supportInfo1Len
  mov ebx, 1
  mov eax, 4
  int 0x80
  call newLine 
  
  call newLine
  pop rcx 
  pop rax 
  add  rcx,8     
  dec  rax       
  
; This loop handles the first question for player 2.
; It displays the question, gets the player's answer, checks if it's correct, and displays the supporting information
  mov  rbx, [rcx] 
  mov [Currentletter],rbx 
  push rax 
  push rcx 
  
  mov  edx,q2Len     
  mov  ecx, q2  
  mov  ebx, 1     
  mov  eax, 4     
  int  0x80      
  
  mov  edx, p2Msglen
  mov  ecx, p2Msg
  mov  ebx, 1
  mov  eax, 4
  int  0x80
  call check_player2
  mov ecx, supportInfo2
  mov edx, supportInfo2Len
  mov ebx, 1
  mov eax, 4
  int 0x80
  call newLine 
  
  call newLine
  pop rcx 
  pop rax 
  add  rcx,8     
  dec  rax       
  
; This loop handles the second question for player 1.
; It displays the question, gets the player's answer, checks if it's correct, and displays the supporting information 
  mov  rbx, [rcx] 
  mov [Currentletter],rbx 
  push rax 
  push rcx 
  
  mov  edx,q3Len     
  mov  ecx, q3  
  mov  ebx, 1     
  mov  eax, 4     
  int  0x80      
  
  mov  edx, p1Msglen
  mov  ecx, p1Msg
  mov  ebx, 1
  mov  eax, 4
  int  0x80
  call check_player1 
  mov ecx, supportInfo3
  mov edx, supportInfo3Len
  mov ebx, 1
  mov eax, 4
  int 0x80
  call newLine 
  
  call newLine
  pop rcx 
  pop rax 
  add  rcx,8     
  dec  rax       
  
; This loop handles the second question for player 2.
; It displays the question, gets the player's answer, checks if it's correct, and displays the supporting information
  mov  rbx, [rcx] 
  mov [Currentletter],rbx 
  push rax 
  push rcx 
  
  mov  edx,q4Len     
  mov  ecx, q4 
  mov  ebx, 1     
  mov  eax, 4     
  int  0x80      
  
  mov  edx, p2Msglen
  mov  ecx, p2Msg
  mov  ebx, 1
  mov  eax, 4
  int  0x80
  call check_player2 
  mov ecx, supportInfo4 
  mov edx, supportInfo4Len
  mov ebx, 1
  mov eax, 4
  int 0x80
  call newLine 
  
  call newLine
  pop rcx 
  pop rax 
  add  rcx,8     
  dec  rax       
  
; This loop handles the third question for player 1.
; It displays the question, gets the player's answer, checks if it's correct, and displays the supporting information
  mov  rbx, [rcx] 
  mov [Currentletter],rbx 
  push rax 
  push rcx 
  
  mov  edx,q5Len     
  mov  ecx, q5  
  mov  ebx, 1     
  mov  eax, 4     
  int  0x80      
  
  mov  edx, p1Msglen
  mov  ecx, p1Msg
  mov  ebx, 1
  mov  eax, 4
  int  0x80
  call check_player1 
  mov ecx, supportInfo5 
  mov edx, supportInfo5Len
  mov ebx, 1
  mov eax, 4
  int 0x80
  call newLine 
  
  call newLine
  pop rcx 
  pop rax 
  add  rcx,8     
  dec  rax       
  
; This loop handles the third question for player 2.
; It displays the question, gets the player's answer, checks if it's correct, and displays the supporting information
    mov  rbx, [rcx] 
  mov [Currentletter],rbx 
  push rax 
  push rcx 
  
  mov  edx,q6Len     
  mov  ecx, q6 
  mov  ebx, 1     
  mov  eax, 4     
  int  0x80      
  
  mov  edx, p2Msglen
  mov  ecx, p2Msg
  mov  ebx, 1
  mov  eax, 4
  int  0x80
  call check_player2
  mov ecx, supportInfo6 
  mov edx, supportInfo6Len
  mov ebx, 1
  mov eax, 4
  int 0x80
  call newLine 
  
  call newLine
  pop rcx 
  pop rax 
  add  rcx,8     
  dec  rax   
  
; This loop handles the fourth question for player 1. 
; It displays the question, gets the player's answer, checks if it's correct, and displays the supporting information  
  mov  rbx, [rcx] 
  mov [Currentletter],rbx 
  push rax 
  push rcx 
  
  mov  edx,q7Len     
  mov  ecx, q7 
  mov  ebx, 1     
  mov  eax, 4     
  int  0x80      
  
  mov  edx, p1Msglen
  mov  ecx, p1Msg
  mov  ebx, 1
  mov  eax, 4
  int  0x80
  call check_player1 
  mov ecx, supportInfo7 
  mov edx, supportInfo7Len
  mov ebx, 1
  mov eax, 4
  int 0x80
  call newLine 
  
  call newLine
  pop rcx 
  pop rax 
  add  rcx,8     
  dec  rax       
      

; This loop handles the fourth question for player 2.
; It displays the question, gets the player's answer, checks if it's correct, and displays the supporting information
  mov  rbx, [rcx] 
  mov [Currentletter],rbx 
  push rax 
  push rcx 
  
  mov  edx,q8Len     
  mov  ecx, q8 
  mov  ebx, 1     
  mov  eax, 4     
  int  0x80      
  
  mov  edx, p2Msglen
  mov  ecx, p2Msg
  mov  ebx, 1
  mov  eax, 4
  int  0x80
  call check_player2 
  mov ecx, supportInfo8 
  mov edx, supportInfo8Len
  mov ebx, 1
  mov eax, 4
  int 0x80
  call newLine 
  
  call newLine
  pop rcx 
  pop rax 
  add  rcx,8     
  dec  rax       
  
; This section of the code calculates and displays the final scores of both players.
; It converts the scores from binary to ASCII, prints the scores, displays the final score message and then display the end of game message
  mov eax, [p1Score]
  add eax, 48
  mov [printP1Score],eax
  mov  edx,1      
  mov  ecx, printP1Score   
  mov  ebx, 1     
  mov  eax, 4    
  int  0x80       
  
  mov  edx,finalScoreMsg_p1len     
  mov  ecx, finalScoreMsg_p1   
  mov  ebx, 1     
  mov  eax, 4     
  int  0x80       
    
  mov eax, [p2Score]
  add eax, 48
  mov [printP2Score],eax
  mov  edx,1      
  mov  ecx, printP2Score   
  mov  ebx, 1     
  mov  eax, 4     
  int  0x80       
   
  mov  edx, finalScoreMsg_p2len      
  mov  ecx,  finalScoreMsg_p2   
  mov  ebx, 1     
  mov  eax, 4    
  int  0x80       
   
  mov edx, endGameMsgLen
  mov ecx, endGameMsg
  mov ebx, 1
  mov eax, 4
  int 0x80
  call done 



; This function checks the answer of player 1. 
; It reads the player's guess, compares it with the correct answer, and calls the appropriate function based on whether the guess is correct or not
 check_player1:
  mov eax, 3 
  mov ebx, 2
  mov ecx, userGuess
  mov edx, 1 
  int 80h	
  mov   rax, [userGuess] 
  cmp   rax, [Currentletter]  
  je    same_player1 
  call Notsame 
  ret 
; This function checks the answer of player 2. 
; It reads the player's guess, compares it with the correct answer, and calls the appropriate function based on whether the guess is correct or not  
 check_player2:
  mov eax, 3 
  mov ebx, 2
  mov ecx, userGuess
  mov edx, 1 
  int 80h	
  mov   rax, [userGuess] 
  cmp   rax, [Currentletter]  
  je    same_player2
  call Notsame  
  ret
  
; This function is called when a player's guess is incorrect.
; It displays the "Incorrect" message and reads the next guess
 Notsame:
  mov   ecx,incorrectMsg 
  mov   edx, incorrectMsglen 
  mov   ebx,1	
  mov   eax,4
  int 80h 

  mov eax, 3 
  mov ebx, 2 
  mov ecx, userGuess 
  mov edx, 1 
  int 80h	
  ret 

; This function is called when player 1's guess is correct.
; It displays the "Correct" message, increments player 1's score, and reads the next guess
same_player1:
  mov   ecx,correctMsg 
  mov   edx, correctMsglen 
  mov   ebx,1	
  mov   eax,4	
  int 80h 
    
  MOV AL, BYTE [p1Score]  
  INC AL                  
  MOV BYTE [p1Score], AL
    
  mov eax, 3 
  mov ebx, 2 
  mov ecx, userGuess 
  mov edx, 1 
  int 80h	
  ret 

; This function is called when player 2's guess is correct.
; It displays the "Correct" message, increments player 2's score, and reads the next guess
same_player2:
  mov   ecx,correctMsg 
  mov   edx, correctMsglen 
  mov   ebx,1	
  mov   eax,4	
  int 80h 
  
  MOV AL, BYTE [p2Score]  
  INC AL                  
  MOV BYTE [p2Score], AL 
     
  mov eax, 3 
  mov ebx, 2 
  mov ecx, userGuess
  mov edx, 1 
  int 80h	
  ret

; This function prints a new line
 newLine:
  mov eax,4 	             	
  mov ebx,1 			
  mov ecx, newline	
  mov edx, 1	
  int 80h 	
  ret	

; This function displays the game introduction
 displayintro:
   mov  edx,introLen      
   mov  ecx, intro   
   mov  ebx, 1     
   mov  eax, 4     
   int  0x80       
   ret 
   
 
; This function ends the program  
 done:
   mov  eax, 1     
   int  0x80       
   

