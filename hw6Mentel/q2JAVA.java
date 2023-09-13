package cs331;

public class question2 {
	
	public static void main(String args[]) {
		
		  int[] array = {5,7,42,34,78,96};
		  int size =  array.length;
		
		  int result = find42(array,size);
		  
		   System.out.print(result);
	}
	
	static int find42(int[] array, int size) {
		int result = -1;
		
		for(int i=0; i<size;  i++) {
			
			if(array[i] == 42)
				result = i;
		}
		
		return result;
	}
}
