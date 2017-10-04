<?php
// src/AppBundle/Form/RegistrationType.php

namespace AppBundle\Form;

use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\FormBuilderInterface;

class EditFriendType extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options)
    {
        $builder
            ->add('age', null, array('attr' => array('class' => "form-control"), 'label' => 'Age'))
            ->add('family', null, array('attr' => array('class' => "form-control"), 'label' => 'Famille'))
        ;
    }

    public function getDefaultOptions(array $options)
    {
        return array(
            'data_class' => 'AppBundle\Entity\User',
        );
    }

    public function getName()
    {
        return 'app_friend_edit';
    }
}