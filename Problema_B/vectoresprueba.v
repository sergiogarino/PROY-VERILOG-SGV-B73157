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
end