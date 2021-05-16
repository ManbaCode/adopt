package com.wind.controller;

import com.wind.entity.AdoptAnimal;
import com.wind.entity.Pet;
import com.wind.entity.Users;
import com.wind.service.AdoptAnimalService;
import com.wind.service.PetService;
import com.wind.service.UsersService;
import com.wind.util.Message;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.mail.MessagingException;
import javax.servlet.http.HttpServletRequest;
import java.text.ParseException;
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

    @Autowired
    private PetService petService;

    @Autowired
    private UsersService usersService;

    @RequestMapping("adopts.action")
    @ResponseBody
    public Message getAdoptAnimals(@RequestParam(value = "pn",defaultValue = "1") Integer pn){
        PageHelper.startPage(pn,4);
        AdoptAnimal animal=new AdoptAnimal();
        List<AdoptAnimal> adoptAnimals = animalService.findByState(1);
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
        pet.setState(1);
        AdoptAnimal animal=new AdoptAnimal();
        animal.setUser(user);
        animal.setPet(pet);
        animal.setState(1);
        animal.setAdoptTime(new Date());
        int i = animalService.addAdoptAnimal(animal);
        int t=petService.updateState(pet);
        if(i>0&&t>0){
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

    @RequestMapping(value = "disAgree.action", method = RequestMethod.GET)
    @ResponseBody
    public Message updateAdoptState(Integer id) throws MessagingException {
        AdoptAnimal animal = animalService.findById(id);
        animal.setState(0);
        Pet pet = animal.getPet();
        pet.setState(0);
        int i = animalService.updateAdoptState(animal);
        int t=petService.updateState(pet);
        if(i>0&&t>0){
            return Message.success();
        }else{
            return Message.fail();
        }
    }

    @RequestMapping(value = "agree.action",method = RequestMethod.GET)
    @ResponseBody
    public Message updateAdoptStates(Integer id) throws MessagingException {
        AdoptAnimal animal = animalService.findById(id);
        animal.setState(2);
        Pet pet = animal.getPet();
        pet.setState(2);
        int a = animalService.updateAdoptState(animal);
        int b=petService.updateState(pet);
        if(a>0&&b>0){
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


    @RequestMapping("findByAdoptTime.action")
    @ResponseBody
    public Message findByAdoptTime(String adoptTime) throws ParseException {
        PageHelper.startPage(1,4);
        List<AdoptAnimal> adoptAnimals = animalService.findByAdoptTime(adoptTime);
        if(adoptAnimals!=null){
            PageInfo page=new PageInfo(adoptAnimals,3);
            return Message.success().add("pageInfo",page);
        }else{
            return Message.fail();
        }

    }

    @RequestMapping("findByName.action")
    @ResponseBody
    public Message findByName(@RequestParam(value = "pn",defaultValue = "1")Integer pn,@RequestParam(value = "userName") String userName,@RequestParam(value = "state") Integer state) throws ParseException {
        PageHelper.startPage(1,4);
        List<Users> users = usersService.findByName(userName);
        List<AdoptAnimal> adoptAnimals = animalService.findByName(users,state);
        if(adoptAnimals!=null){
            PageInfo page=new PageInfo(adoptAnimals,3);
            return Message.success().add("pageInfo",page);
        }else{
            return Message.fail();
        }

    }
}
