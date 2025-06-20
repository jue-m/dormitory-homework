#include <stdio.h>
#include <math.h>

int main()
{
	//定义一些拥有意义的变量
	double x;
	double y,z;
	double a;
	//定义一些用来计数的变量 
	int m=1;
	int n=0;
	int l=0;
	int f,g;
	//表明主旨 
	printf("——用书上的公式计算圆周率的近似值——\n");
	printf("请在下方输入您准备使用公式中的前几项来依次计算圆周率的近似值。\n");
	printf("注意，若您使用的项数过少，将无法告知您最先得到3.14等数值的时候分别使用了公式中的前几项。\n\n"); 
	scanf("%d",&g);
	printf("\n");
	//y为每一项的分母，z决定着每一项的正负。
	y=1;
	z=2;
	//进入循环
	for(;m<=g;m++)
	{a=pow(-1,z)*4/y;//a表示公式中的项。 
	x=x+a;//x表示各项之和，即圆周率的近似值。 
	
	y=y+2; 
	z++;
	
	//表格的制造 
	for(;n>=5;)
	{printf("\n");
	n=0;
	}
	
	l++;
	n++;
	
	printf("前%d项：%-10f\t",l,x);
    }
    
    
    
    //计算最先得到3.14等数值的时候，分别使用了公式中的前几项。 
    y=1;z=2;
	m=1;
	f=0;
	x=0;
	
	for(;m<=g;m++)
	{a=pow(-1,z)*4/y;
	x=x+a;
	y=y+2; 
	z++;
	f++;
	if(x>=3.14&&x<3.15)
	{printf("\n\n使用了公式中的前%d项时最先得到3.14；",f);
	break;}
    }
    
    y=1;z=2;
	m=1;
	f=0;
	x=0;
	
	for(;m<=g;m++)
	{a=pow(-1,z)*4/y;
	x=x+a;
	y=y+2; 
	z++;
	f++;
	if(x>=3.141&&x<3.142)
	{printf("\n使用了公式中的前%d项时最先得到3.141；",f);
	break;}
    }
    
    y=1;z=2;
	m=1;
	f=0;
	x=0;
	
	for(;m<=g;m++)
	{a=pow(-1,z)*4/y;
	x=x+a;
	y=y+2; 
	z++;
	f++;
	if(x>=3.1415&&x<3.1416)
	{printf("\n使用了公式中的前%d项时最先得到3.1415；",f);
	break;}
    }
	
	y=1;z=2;
	m=1;
	f=0;
	x=0;
	
	for(;m<=g;m++)
	{a=pow(-1,z)*4/y;
	x=x+a;
	y=y+2; 
	z++;
	f++;
	if(x>=3.14159&&x<3.14160)
	{printf("\n使用了公式中的前%d项时最先得到3.14159。",f);	
	break;}
    }
	
	return 0;
}
