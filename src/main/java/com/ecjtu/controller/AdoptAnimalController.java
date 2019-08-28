package com.ecjtu.controller;

import com.ecjtu.entity.AdoptAnimal;
import com.ecjtu.entity.Pet;
import com.ecjtu.entity.Users;
import com.ecjtu.service.AdoptAnimalService;
import com.ecjtu.util.MailUtil;
import com.ecjtu.util.Message;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.jws.soap.SOAPBinding;
import javax.mail.MessagingException;
import javax.servlet.http.HttpServletRequest;
import java.util.Date;
import java.util.List;

/**
 * @author Mr Wu
 * @create: 2019-08-22 10:23
 */
@Controller
@RequestMapping("adopt")
public class AdoptAnimalController {

    @Autowired
    private AdoptAnimalService animalService;




    @RequestMapping("adopts.action")
    @ResponseBody
    public Message getAdoptAnimals(@RequestParam(value = "pn",defaultValue = "1") Integer pn){
        PageHelper.startPage(pn,4);
        List<AdoptAnimal> adoptAnimals = animalService.getAdoptAnimals();
        PageInfo page=new PageInfo(adoptAnimals,2);
        return Message.success().add("pageInfo",page);
    }


    @RequestMapping("ByAgree.action")
    @ResponseBody
    public Message getAdoptStates(@RequestParam(value = "pn",defaultValue = "1") Integer pn){
        PageHelper.startPage(pn,4);
        int state=2;
        List<AdoptAnimal> adoptAnimals = animalService.findByState(state);
        PageInfo page=new PageInfo(adoptAnimals,2);
        return Message.success().add("pageInfo",page);
    }

    @RequestMapping("ByDisAgree.action")
    @ResponseBody
    public Message getAdoptDisagress(@RequestParam(value = "pn",defaultValue = "1") Integer pn){
        PageHelper.startPage(pn,4);
        int state=0;
        List<AdoptAnimal> adoptAnimals = animalService.findByState(state);
        PageInfo page=new PageInfo(adoptAnimals,2);
        return Message.success().add("pageInfo",page);
    }

    @RequestMapping("create.action")
    @ResponseBody
    public Message createAdopt(HttpServletRequest request){
        Pet pet = (Pet)request.getSession().getAttribute("pet");
        Users user = (Users)request.getSession().getAttribute("user");
        AdoptAnimal animal=new AdoptAnimal();
        animal.setUser(user);
        animal.setPet(pet);
        animal.setAdoptTime(new Date());
        int i = animalService.addAdoptAnimal(animal);
        if(i>0){
            return Message.success();
        }else{
            return Message.fail();
        }
    }

    @RequestMapping("delete.action")
    @ResponseBody
    public Message deleteAdopt(Integer id){
        if(animalService.deleteAdoptAnimal(id)>0){
            return Message.success();
        }else{
            return Message.fail();
        }
    }

    @RequestMapping("update.action")
    @ResponseBody
    public Message updateAdoptAnimal(AdoptAnimal animal){
        if(animalService.updateAdoptAnimal(animal)>0){
            return Message.success();
        }else{
            return Message.fail();
        }
    }

    @RequestMapping("disAgree.action")
    @ResponseBody
    public Message updateAdoptState(Integer id) throws MessagingException {
        AdoptAnimal animal=new AdoptAnimal();
        animal.setId(id);
        animal.setState(0);
        int i = animalService.updateAdoptState(animal);
        if(i>0){
            return Message.success();
        }else{
            return Message.fail();
        }
    }

    @RequestMapping("agree.action")
    @ResponseBody
    public Message updateAdoptStates(Integer id) throws MessagingException {
        AdoptAnimal animal=new AdoptAnimal();
        animal.setId(id);
        animal.setState(2);
        if(animalService.updateAdoptState(animal)>0){
            return Message.success();
        }else{
            return Message.fail();
        }
    }
    @RequestMapping("findById.action")
    @ResponseBody
    public Message findById(Integer id){
        AdoptAnimal animal = animalService.findById(id);
        if(animal!=null){
            return Message.success().add("animal",animal);
        }else{
            return Message.fail();
        }
    }
}
