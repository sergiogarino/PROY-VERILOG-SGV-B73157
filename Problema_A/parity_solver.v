/* Autor: Sergio Garino Vargas
 * Carné: B73157
 * Fecha de entrega: 9/12/2022
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