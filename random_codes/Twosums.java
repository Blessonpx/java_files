import java.util.*;

public class Twosums{
	public int[] return2Sums(int[] nums,int target){
		int n=nums.length;
		HashMap<Integer,Integer> nMap = new HashMap();
		for(int i=0;i<n;i++){
			int complement = target- nums[i];
			if(nMap.containsKey(complement)){
				return new int[] {nMap.get(complement),i};
			}
			else {
				nMap.put(nums[i],i);
			}
		}
		return new int[] {};
	}
	public static void main(String[] args){
		int[] input = {2,7,11,15};
		int target = 0;
		//nums = [2,7,11,15], target = 9;
		int[] out = return2Sums(nums,target);
		System.out.println(out);
		
	}
}
