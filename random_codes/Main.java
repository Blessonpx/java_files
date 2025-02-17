class Test <T>{
	T obj;
	Test(T obj) {this.obj=obj;}
	public T getObject(){return obj;}
}
public class Main{
	public static void  main(String[] args){
		Test<Integer> newObj = new Test<Integer>(15);
		System.out.println(newObj.getObject());
	}
}
