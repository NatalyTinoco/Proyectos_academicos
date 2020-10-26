/**
 * 
 */
package corte3;

import java.util.Scanner;

/**
 * @author Nat
 *
 */
public class proyecto {

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		// TODO Auto-generated method stub
	            int n=0;
				Scanner teclado = new Scanner(System.in);
				System.out.println("deme numero de participantes");
				n=teclado.nextInt();
			    String participantes[] = new String[n];
		        double puntos[][]=new double[n][3];
		        double pfinal[]=new double[n];
		        double canciones[]=new double[3];
		        double promf =0.0;
		      
		        for (int i=0;i<n;i++){
		            System.out.println("Deme nombre participante"+(i+1)+":");
		           participantes[i]=teclado.next();
		        }
		        for (int col=0;col<3;col++){
		            for (int fila=0;fila<n;fila++){
		                System.out.println("deme puntaje cancion "+(col+1)+" de "+participantes[fila]);
		                puntos[fila][col]=teclado.nextDouble();
		            }
		            }
		        for (int fila=0;fila<n;fila++){
		            for (int col=0;col<3;col++){
		                    pfinal[fila]=pfinal[fila]+puntos[fila][col];	        	         
	           }
	}
		        int pos=0;
		        double mayor=0.0;
		        mayor=pfinal[0];
		        for (int i=0;i<n;i++){
		            if (pfinal[i]>mayor){
		                mayor=pfinal[i];
		                pos=i;
		            }
		        }
		            System.out.println("participante"+"\t"+"\t"+"\t"+"puntos"+"\t"+"\t"+"\t"+"\t"+"puntaje Final");
		            
		            for (int fila=0;fila<n;fila++){
		                System.out.print(participantes[fila]+"\t"+"\t");
		                for (int col=0;col<3;col++){
		                    System.out.print(puntos[fila][col]+"\t"+"\t");
		                }
		                System.out.println(pfinal[fila]);
		            }
		            System.out.println("El participante ganador es: "+participantes[pos]+" con :" +mayor);
		        }
	}








