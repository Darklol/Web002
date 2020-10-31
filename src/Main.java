import test.Hello;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import java.util.Hashtable;

public class Main {
    public static void main(String[] args) {
        final Hashtable<String, String> jndiProperties = new Hashtable<>();
        jndiProperties.put(Context.URL_PKG_PREFIXES, "org.jboss.ejb.client.naming");
        try {
            final Context context = new InitialContext(jndiProperties);
            Hello hello = (Hello) context.lookup("ejb:/Server_war_exploded/HelloBeanEJB!test.Hello");
            System.out.println(hello.say());
        } catch (NamingException e) {
            e.printStackTrace();
        }
    }
}