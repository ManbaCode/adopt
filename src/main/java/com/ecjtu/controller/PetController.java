package com.ecjtu.controller;

import com.ecjtu.entity.Pet;
import com.ecjtu.service.PetService;
import com.ecjtu.util.Message;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

/**
 * @author Mr Wu
 * @create: 2019-08-22 10:21
 */
@Controller
@RequestMapping("pet")
public class PetController {

    @Autowired
    private PetService petService;

    @RequestMapping("/getPets.action")
    public String getPets(ModelAndView modelAndView){
        List<Pet> pets = petService.getPets();
        modelAndView.addObject("pets",pets);
        return "admin/pet";
    }

    @RequestMapping("/create.action")
    @ResponseBody
    public Message createPet(Pet pet){
        if(petService.addPet(pet)>0){
            return Message.success();
        }else{
            return Message.fail();
        }
    }

    @RequestMapping("/delete.action")
    @ResponseBody
    public Message deletePet(Integer id){
        if(petService.deletePet(id)>0){
            return Message.success();
        }else {
            return Message.fail();
        }
    }

    @RequestMapping("/update.action")
    @ResponseBody
    public Message updatePet(Pet pet){
        if(petService.updatePet(pet)>0){
            return Message.success();
        }else{
            return Message.fail();
        }
    }

    @RequestMapping("/findById.action")
    @ResponseBody
    public Pet findById(Integer id){
        Pet pet = petService.findById(id);
        if(pet!=null){
            return pet;
        }else{
            return null;
        }
    }

    @RequestMapping("/findByName.action")
    @ResponseBody
    public Pet findByName(String petName){
        Pet byName = petService.findByName(petName);
        if(byName!=null){
            return byName;
        }else{
            return null;
        }
    }



}
