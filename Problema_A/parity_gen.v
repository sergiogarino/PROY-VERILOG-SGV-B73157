/* Autor: Sergio Garino Vargas
 * Carné: B73157
 * Fecha de entrega: 9/12/2022
 */

 /*
 * En este archivo se tiene el módulo PARITY_GEN el cual se encarga de revisar
 * la paridad con base en el conteo que le proporciona ONES_COUNT y leyendo un
 * dígito más de la palabra, el módulo por ende recibe 3 entradas, que son 
 * dígitos de la palabra, llama a ONES_COUNT para revisar los dos primeros 
 * dígitos que recibe y luego con parity_one se implementa la función que se
 * obtuvo de los MK para checar la paridad que se lleva.
 */

`include "ones_count.v"

module PARITY_GEN ( input [2:0] digit,
                    output parity_one);

    wire w_1, w_2;

    ONES_COUNT par_check (.x_i(digit[0]), .x_j(digit[1]), .w_i(w_1), .w_j(w_2));
    
    assign parity_one = ((~w_2)&(digit[2])) | ((w_2)&(digit[2]));
    
endmodule
 