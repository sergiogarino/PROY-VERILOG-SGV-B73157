/* Autor: Sergio Garino Vargas
 * Carné: B73157
 * Fecha de entrega: 9/12/2022
 */

/*
 * El módulo ONES_COUNT se implementa con el uso de un MUX4x1 el cual se
 * encarga de seleccionar y poner en la salida el número de 1s que haya
 * recibido el módulo. Como bien se sabe el MUX 4x1 tiene dos líneas de 
 * selección, en ellas es en las que se van a poner 2 de los bits de la
 * palabra de entrada y la selección será como se explica a continuación:
 * 00 -> opción 0 = 00
 * 01 -> opción 1 = 01
 * 10 -> opción 2 = 01
 * 11 -> opción 3 = 10
 */

`include "MUX4x1_Case.v"

module ONES_COUNT ( input x_i, x_j,
                    output w_i, w_j);

    reg [3:0] exit_w_i = 4'b0001;
    reg [3:0] exit_w_j = 4'b0110;

    MUX4x1_Case x_first  (.I(exit_w_i), .S({x_i, x_j}), .Y(w_i));
    MUX4x1_Case x_second (.I(exit_w_j), .S({x_i, x_j}), .Y(w_j));

endmodule
