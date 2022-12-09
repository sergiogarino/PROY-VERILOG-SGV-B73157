/* 
 * Autor: Sergio Garino Vargas
 * Carné: B73157
 * Fecha de entrega: 9/12/2022
 *
 */
`timescale 1ns/1ps

module Test_Mezcladora;

    reg Clk, Reset;
    reg IN, TOK, P1, P2;

    wire V1, V2, V3, M, T, S, B;

    reg [3:0] testvectors [12:0];
    integer vectornum;

    Mezcladora uut (
        .Clk(Clk) , .Reset(Reset) ,
        .IN(IN) , .TOK(TOK) , .P1(P1) , .P2(P2) ,
        .V1(V1) , .V2(V2) , .V3(V3) , .M(M) , .T(T) , .S(S) , .B(B)
        );

    initial 
        begin
            /* IN, TOK, P1, P2 */
            testvectors[0] = 4'b0000; // IN=0 TOK=x P1=x P2=x a
            testvectors[1] = 4'b1000; // IN=1 TOK=x P1=x P2=x pasa a b
            testvectors[2] = 4'b0000; // IN=x TOK=x P1=0 P2=x se queda en b
            testvectors[3] = 4'b0010; // IN=X TOK=X P1=1 P2=X PASA A C
            testvectors[4] = 4'b0011; // IN= TOK=0 P1= P2= SE QUEDA EN C
            testvectors[5] = 4'b0111; // IN= TOK=1 P1= P2= PASA A D
            testvectors[6] = 4'b0011; // IN= TOK=0 P1= P2= SE QUEDA EN D
            testvectors[7] = 4'b0111; // IN= TOK=1 P1= P2= PASA A E
            testvectors[8] = 4'b0010; // IN= TOK= P1=1 P2= SE QUEDA EN E 
            testvectors[9] = 4'b0001; // IN= TOK= P1=0 P2=1 SE QUEDA EN E
            testvectors[10] = 4'b0000; // IN= TOK= P1=0 P2=0 VA A a
            testvectors[11] = 4'b0000;
            testvectors[12] = 4'b0000;
            //testvectors[x] = 4'bXXXX; // IN= TOK= P1= P2=

            vectornum = 0;

            Reset = 1;
            #3 Reset = 0;

            $dumpfile("Mezcla.vcd");
            $dumpvars(0, Test_Mezcladora);

        end 

    always 
        begin
            Clk = 1; #5; Clk = 0; #5;
        end

    always @ (negedge Clk) 
        begin
            {IN, TOK, P1, P2} = testvectors [vectornum];
            $display;
                $display ("Las entradas son IN = %b, TOK = %b, P1 = %b, P2 = %b", IN, TOK, P1, P2);
        end

    always @ (posedge Clk) 
    #1 if (!Reset)
        begin
            $display ("Las salidas son V1=%b, V2=%b, V3=%b, M=%b, T=%b, S=%b, B=%b", V1, V2, V3, M, T, S, B);
            vectornum = vectornum + 1;
                if (vectornum == 13)
                    $finish;
        end

endmodule