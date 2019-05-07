package util;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

	public class ConexionAll {
	
	private static EntityManager em = null;

	public ConexionAll() {
		// TODO Auto-generated constructor stub
		em = this.getEm();
	}
	
	public static EntityManager getEm(){
		if ( em == null ) {
			EntityManagerFactory emf = Persistence.createEntityManagerFactory("shadiagram1.0");
            em = emf.createEntityManager();
        }
		return em;
	}

}
