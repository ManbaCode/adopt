package com.ecjtu.service.impl;

import com.ecjtu.entity.Pet;
import com.ecjtu.mapper.PetMapper;
import com.ecjtu.service.PetService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author Mr Wu
 * @create: 2019-08-21 10:59
 */

@Service
public class PetServiceImpl implements PetService {

    @Autowired
    private PetMapper petMapper;
    @Override
    public int addPet(Pet pet) {
        int i = petMapper.addPet(pet);
        return i;
    }

    @Override
    public int deletePet(Integer id) {
        int i = petMapper.deletePet(id);
        return i;
    }

    @Override
    public int updatePet(Pet pet) {
        int i = petMapper.updatePet(pet);
        return i;
    }

    @Override
    public List<Pet> getPets() {
        List<Pet> pets = petMapper.getPets();
        return pets;
    }

    @Override
    public Pet findById(Integer id) {
        Pet byId = petMapper.findById(id);
        return byId;
    }

    @Override
    public Pet findByName(String petName) {
        Pet byName = petMapper.findByName(petName);
        return byName;
    }

    @Override
    public void deleteBatch(List<Integer> ids) {
        petMapper.deleteBatch(ids);
    }
}
