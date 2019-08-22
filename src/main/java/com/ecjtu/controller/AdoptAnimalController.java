package com.ecjtu.controller;

import com.ecjtu.entity.AdoptAnimal;
import com.ecjtu.service.AdoptAnimalService;
import com.ecjtu.util.Message;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

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


    @RequestMapping("getAdopts.action")
    public String getAdoptAnimals(ModelAndView modelAndView){
        List<com.ecjtu.entity.AdoptAnimal> adoptAnimals = animalService.getAdoptAnimals();
        modelAndView.addObject("adoptAnimals",adoptAnimals);
        return "admin/adopt";
    }

    @RequestMapping("create.action")
    @ResponseBody
    public Message createAdopt(AdoptAnimal adoptAnimal){
        if(animalService.addAdoptAnimal(adoptAnimal)>0){
            return Message.success();
        }else{
            return Message.fail();
        }
    }

    @RequestMapping("delete.action")
    @ResponseBody
    public Message deletAdopt(Integer id){
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

    @RequestMapping("findById.action")
    @ResponseBody
    public AdoptAnimal findById(Integer id){
        AdoptAnimal byId = animalService.findById(id);
        if(byId!=null){
            return byId;
        }else{
            return null;
        }
    }
}
