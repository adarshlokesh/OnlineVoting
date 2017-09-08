package modal;

import dao.UserInterface;
import dao.daoimp;


public class UserValidate {
public boolean validateUser(int aid,String password){
		
		UserInterface uli = new daoimp();
		return uli.validateUser(aid, password);
		
		
	}

}
