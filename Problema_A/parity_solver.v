/* Autor: Sergio Garino Vargas
 * Carné: B73157
 * Fecha de entrega: 9/12/2022
 */

/*
 * Este archivo corresponde al modulo final PARITY_SOLVER, este se encarga de
 * tomar los 7 bits de la palabra de entrada con el arreglo digits, le pasa 6 
 * de esos bits a 2 instaciaciones del tipo PARITY_GEN que resulven parte de 
 * paridad y con ese resultado más el último bit de la palabra se define la 
 * paridad de la palabra y se da la salida R.
 */
 `include "parity_gen.v"

 module PARITY_SOLVER ( input  [6:0] digits,
                        output R);

    wire par_gen_1, par_gen_2;

    PARITY_GEN first_check (.digit(digits[6:4]), .parity_one(par_gen_1));
    PARITY_GEN decond_check (.digit(digits[3:1]), .parity_one(par_gen_2));


    /* 
     * Con el fin de hacer la salida R más legible la divido en sus cuatro
     * componentes principales y se ve más fácilmente la SDP.
     */
    wire A, B, C, D;
    assign A = (~par_gen_1) & (~par_gen_2) & (digits[0]);
    assign B = (~par_gen_1) & (par_gen_2) & (~digits[0]);
    assign C = (par_gen_1) & (~par_gen_2) & (~digits[0]);
    assign D = (par_gen_1) & (par_gen_2) & (digits[0]);
    assign R = A | B | C | D;

    
 endmodule