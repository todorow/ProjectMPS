# ProjectMPS
## ПРОЕКТ 7 (MikroC):
 Напишете програма за PIC16F887 кој се користи за авторизација.
Контролерот е поврзан со LCD екран (пинови од портата D), Keypad тастатура (портата A),
сериска комуникација овозможена преку EURSART (пинови од портата C), тастер за аларм
(поврзан на пинот B0) и аналоген влез (од пинот E0).
## Модови
Контролерот има два мода за работа: администраторски и кориснички. На почетокот
програмата е во администраторски мод.
### Администраторски мод 
Во администраторски мод преку EUSART се внесуваат информации за кориснички
броеви (најмногу 10 цифри) и шифри (вредност до 1023) за најмногу 10 корисници
на системот. Важно е да напоменеме дека овие податоци треба да бидат сместени
во EEPROM.
Во овој мод прво администраторот го праќа типот на барање: ADD, ERASE или END.
Откако програмата откако ќе добие порака ADD или ERASE, праќа дозвола за
праќање на дополнителни податоци со праќање на START. Потоа, во рок од 60ms,
администраторот ги праќа и се примаат потребните информации. Ако
администраторот поднел барање ADD, тој бара додавање на нов корисник, па
потребно е да внесат два броја (низа од цифри одделени со празно место) кои ги
претставуваат корисничкиот број и шифрата на корисникот. Ако поднел барање
ERASE, администраторот бара бришење на постоечки корисник, па потребно е да
внесе еден број кои го претставуваат корисничкиот број за корисникот. По успешно
примање на податоци администраторот добива порака ОК или ERROR за тоа дали
успешно е прочитано барањето на администраторот. Во случај кога барањето на
корисникот е END, програмата влегува во кориснички мод. По завршување на
секое барање корисникот може да поднесе ново барање.
### Кориснички мод
Во корисничкиот мод предвидено е корисниците да можат да авторизираат некоја
акција (не е важно каква акција е тоа). Авторизацијата се остварува така што
корисникот прво преку тастатурата го внесува својот кориснички број, го притиска
тастерот ENTER, па потоа внесува шифра преку аналогниот пин и откако аналогниот
сигнал ја претставува шифрата тогаш притиска CODE. За да биде валидна
авторизацијата потребно е корисничкиот број и шифрата да се поклопат со
податоците за некој корисник кои се веќе во EEPROM. Ако корисникот направил
точна авторизација на екранот се печати: Validna avtorizacija, а инаку се печати
Nevalidna avtorizacija. Ако корисничкото име не е валидно не може да се прочита
влез од аналогниот пин. Без разлика каков е исходот, по 10ms повторно може да се
прави авторизација. Ако по пишувањето на корисничкиот број корисникот
притисне EXIT, повторно се внесува шифра од аналогниот пин, па ако се направи
точна авторизација програмата преминува во администраторски мод.
### KeyPad 
Значењето на тастатурата при внесувањето на кодот е:

```
1 | 2  | 3 | ID
4 | 5  | 6 |CODE
7 | 8  | 9 | EXIT
0 |BACK|   |ENTER

```
Со тастерот BACK се брише последната притисната цифра. Со тастерот ID, корисникот од
почеток внесува нов кориснички број, а со CODE ја чита вредноста на шифрата од
аналогниот пин.
Со притискање на алармот, се случува прекин, и тогаш сите податоци од EEPROM се
бришат и програмата влегува во администраторски мод.
### Пример на извршување:

```
Сериска комуникација (се прима): zsdhsdadАDD
Сериска комуникација (се праќа): START
Сериска комуникација (се прима за време од 60ms): 125 25
(се додава корисник со кориснички број 125 и шифра 25)
Сериска комуникација (се праќа): OK
Сериска комуникација (се прима): zadАDD
Сериска комуникација (се праќа): START
Сериска комуникација (се прима за време од 60ms): 545555 1000
(се додава корисник со кориснички број 545555 и шифра 1000)
Сериска комуникација (се праќа): OK
Сериска комуникација (се прима): zadАDD
Сериска комуникација (се праќа): START
Сериска комуникација (се прима за време од 60ms): 54551
(ништо не се додава затоа што не е вчитан валиден број и шифра во даденото време)
Сериска комуникација (се праќа): ERROR
Сериска комуникација (се прима): zadERASE
Сериска комуникација (се праќа): START
Сериска комуникација (се прима за време од 60ms): 545555
(се брише корисникот со број 545555)
Сериска комуникација (се праќа): OK
Сериска комуникација (се прима): END
(програмата влегува во кориснички мод. Да забележиме дека има само еден корисник со број 125)
LCD ред 1: v n E s i b r o j
LCD ред 2:
Keypad: 1 3 BACK 2 5 ENTER (додека се внесуваат тастерите се печати внесениот кориснички број)
LCD ред 1: v n E s i b r o j
LCD ред 2: 1 2 5
Аналоген влез (E0): 25
Keypad: CODE (се вчитува вредноста на аналогниот пин што е 25)
LCD ред 1: v a l i d n a
LCD ред 2: a v t o R i z a c i j a
(по 10 ms повторно може да се прави авторизација)
LCD ред 1: v n E s i b r o j
LCD ред 2:
Keypad: 1 3 BACK 2 5 ENTER (додека се внесуваат тастерите се печати внесениот кориснички број)
LCD ред 1: v n E s i b r o j
LCD ред 2: 1 2 5
Аналоген влез (E0): 250
Keypad: CODE (се вчитува вредноста на аналогниот пин што е 250)
LCD ред 1: n e v a l i d n a
LCD ред 2: a v t o R i z a c i j a
(по 10 ms повторно може да се прави авторизација)
LCD ред 1: v n E s i b r o j
LCD ред 2:
Keypad: 1 3 ID 1 3 5 ENTER (додека се внесуваат тастерите се печати внесениот кориснички број)
LCD ред 1: v N E s i b r o j
LCD ред 2: 1 3 5
(корисникот го нема)
LCD ред 1: n e V a l i d e n
LCD ред 2: k o R i s n i k
(по 10 ms повторно може да се прави авторизација)
LCD ред 1: v n E s i b r o j
LCD ред 2:
Keypad: 1 3 ID 1 2 5 EXIT (додека се внесуваат тастерите се печати внесениот кориснички број)
LCD ред 1: v N E s i b r o j
LCD ред 2: 1 2 5


(програмата влегува во администраторски мод. Да забележиме дека има само еден корисник со број)
Сериска комуникација (се прима): END
(програмата влегува во кориснички мод. Да забележиме дека има само еден корисник со број)
Прекин од B0: (се од EEPROM меморија се брише и повторно сме во администраторски мод)

```
...