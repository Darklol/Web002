package test;

import javax.ejb.Remote;

@javax.ejb.Stateless(name = "HelloBeanEJB")
@Remote(Hello.class)
public class HelloBean implements Hello {
    public HelloBean() {
    }

    @Override
    public String say() {
        return "Hello World";
    }
}
