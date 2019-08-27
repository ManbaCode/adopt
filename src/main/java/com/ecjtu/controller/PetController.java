package com.ecjtu.controller;

import com.ecjtu.entity.Pet;
import com.ecjtu.service.PetService;
import com.ecjtu.util.MailUtil;
import com.ecjtu.util.Message;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import java.util.ArrayList;
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

    @RequestMapping("pets.action")
    @ResponseBody
    public Message getPets(@RequestParam(value = "pn",defaultValue = "1")Integer pn){
        PageHelper.startPage(pn,3);
        List<Pet> pets = petService.getPets();
        PageInfo page=new PageInfo(pets,2);
        return Message.success().add("pageInfo",page);
    }

    @RequestMapping(value = "create.action")
    @ResponseBody
    public Message createPet(Pet pet,@RequestParam(value = "file") MultipartFile file){
        String load = FileLoad.load(file);
        pet.setPic(load);
        if(petService.addPet(pet)>0){
            return Message.success();
        }else{
            return Message.fail();
        }
    }

    @RequestMapping("delete.action")
    @ResponseBody
    public Message deletePet(Integer id){
        if(petService.deletePet(id)>0){
            return Message.success();
        }else {
            return Message.fail();
        }
    }

    @RequestMapping("update.action")
    @ResponseBody
    public Message updatePet(Pet pet){
        if(petService.updatePet(pet)>0){
            return Message.success();
        }else{
            return Message.fail();
        }
    }

    @RequestMapping("findById.action")
    @ResponseBody
    public Message findById(Integer id, Model model){
        Pet pet = petService.findById(id);
        String pic = pet.getPic();
        String[] split = pic.split(",");
        List<String> pics=new ArrayList<>();
        for(int i=0;i<split.length;i++){
            pics.add(split[i]);
        }
        model.addAttribute("pics",pic);
        model.addAttribute("pet",pet);
        if(pet!=null){
            return Message.success().add("pet",pet);
        }else{
            return Message.fail();
        }
    }

    @RequestMapping("findByName.action")
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
