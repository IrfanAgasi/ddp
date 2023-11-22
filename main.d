import std.stdio;
import std.conv;

int main()
{
    string filepath = "../input";
    int[] data = [377, 781, 437, 681, 556, 337, 724, 883, 834, 255, 52, 599, 145, 296, 931, 197, 641, 496, 92];
    solve_sort_indexes(data);
    return 0;
}

class Foo {
    int values;
    int index;
    this(int values, int index){
        this.values = values;
        this.index = index;
    }
}

void solve_sort_indexes(int[] data){
    Foo[] arrays = new Foo[data.length];
    for(int i=0;i<data.length;i++)
        arrays[i] = new Foo(data[i], i+1);
    for(int i=0;i<data.length;i++){
        for(int j=0;j<data.length-1;j++){
            if(arrays[j].values > arrays[j+1].values){
                swap(arrays[j], arrays[j+1]);
                swap(data[j], data[j+1]);
            }
        }
    }
    int[] indices = new int[data.length];
    for(int i=0;i<data.length;i++){
        indices[i] = arrays[i].index;
    }
    // print!int.printArray(data);
    print!int.printArray(indices);
}

void swap(ref Foo a, ref Foo b){
    Foo temp;
    temp = b;
    b = a;
    a = temp;
}

void swap(ref int a, ref int b){
    int temp;
    temp = b;
    b = a;
    a = temp;
}

template print(T){
    void printArray(T[] arr){
        foreach (T val; arr)
        {
            writef("%d ", val);
        }
        writeln();
    }
}