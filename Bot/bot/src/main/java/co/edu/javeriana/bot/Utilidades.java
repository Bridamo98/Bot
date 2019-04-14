package co.edu.javeriana.bot;

import java.util.Map;
import java.util.Stack;

public class Utilidades {
	public static Object buscarElemento(String llave,Stack <Map<String,Object>> symbolTable)
	{


		for(int i=symbolTable.size()-1; i>=0;i--)
		{
			if(symbolTable.get(i).get(llave)!=null)
			{
				return symbolTable.get(i).get(llave);
			}
		}
		return null;
	}
	public static Map<String,Object> buscarMapaDondeSeUbicaElemento(String llave,Stack <Map<String,Object>> symbolTable)
	{


		for(int i=symbolTable.size()-1; i>=0;i--)
		{
			if(symbolTable.get(i).get(llave)!=null)
			{
				return symbolTable.get(i);
			}
		}
		return null;
	}
}
