/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.shopping;

import java.util.HashMap;
import java.util.Map;

/**
 *
 * @author TQK
 */
public class Cart {
    private Map<String,TeaSell> cart;

    public Cart() {
    }

    public Cart(Map<String, TeaSell> cart) {
        this.cart = cart;
    }

    public Map<String, TeaSell> getCart() {
        return cart;
    }

    public void setCart(Map<String, TeaSell> cart) {
        this.cart = cart;
    }
    
    public boolean add(TeaSell tea){
        boolean check = false;
        if(this.cart == null){
            this.cart = new HashMap<>();
        }
        //trong gio hang co chua san pham hay chua
        if(this.cart.containsKey(tea.getpID())){
            int currentQuantity = this.cart.get(tea.getpID()).getpQuantity();
            tea.setpQuantity(currentQuantity + tea.getpQuantity());
        }
        this.cart.put(tea.getpID(), tea);
        check = true;
        return check;
    }
    
    public boolean remove(String id){
        boolean check = false;
        if (this.cart != null){
            if (this.cart.containsKey(id)) {
                this.cart.remove(id);
                check = true;
            }
        }
        return check;
    }
    
    public boolean update(String id, TeaSell tea){
        boolean check = false;
        if(this.cart != null){
            if(this.cart.containsKey(id)){
                this.cart.replace(id, tea);
                check = true;
            }
        }
        return check;
    }
    
}
