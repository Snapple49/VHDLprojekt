
set labelCount 4                                             
set uniqueLabel 1043217304
#################################################################################


##Editing for Signal sim:/rs232_project/UART_RX
# "Constant Pattern"
# Start Time = 834328 ns, End Time = 1 ms, Period = 0 ns
#################################################################################

        noforce sim:/rs232_project/UART_RX
        force -freeze sim:/rs232_project/UART_RX  1 0 ns, 0 1000 ns, 1 105166 ns, 0 209332 ns, 1 313498 ns, 0 834328 ns

when -label 1043217304_1 {$now = @938494 ns} {
        set whenArray(1043217304_1) 1043217304_1
        noforce sim:/rs232_project/UART_RX
        force -freeze sim:/rs232_project/UART_RX  1 0 ns
}

when -label 1043217304_2 {$now = @1000000 ns} {
        set whenArray(1043217304_2) 1043217304_2
        noforce sim:/rs232_project/UART_RX
        force -freeze sim:/rs232_project/UART_RX 1 0 ns
}


##Editing for Signal sim:/rs232_project/source_clock
# "Clock Pattern" : dutyCycle = 50
# Start Time = 0 ns, End Time = 1 ms, Period = 20 ns
#################################################################################


noforce sim:/rs232_project/source_clock
force -freeze sim:/rs232_project/source_clock 0 0 ns,1 10 ns  -repeat 20 ns -cancel @1000000 ns

when -label 1043217304_3 {$now = @1000000 ns} {
        set whenArray(1043217304_3) 1043217304_3
        noforce sim:/rs232_project/source_clock
        force -freeze sim:/rs232_project/source_clock 1 0 ns
}


##Editing for Signal sim:/rs232_project/freq_select
# "Constant Pattern"
# Start Time = 0 ns, End Time = 1 ms, Period = 0 ns
#################################################################################

        noforce sim:/rs232_project/freq_select
        force -freeze sim:/rs232_project/freq_select 1 0 ns 

when -label 1043217304_4 {$now = @1000000 ns} {
        set whenArray(1043217304_4) 1043217304_4
        noforce sim:/rs232_project/freq_select
        force -freeze sim:/rs232_project/freq_select 1 0 ns
}
