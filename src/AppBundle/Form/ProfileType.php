<?php
// src/AppBundle/Form/RegistrationType.php

namespace AppBundle\Form;

use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\FormBuilderInterface;

class ProfileType extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options)
    {
        $builder
            ->add('username', null, array('attr' => array('class' => "form-control"), 'label' => 'form.username', 'translation_domain' => 'FOSUserBundle'))
            ->add('email', 'email', array('attr' => array('class' => "form-control"), 'label' => 'form.email', 'translation_domain' => 'FOSUserBundle'))
        ;

        $builder->add('current_password', 'password', array(
            'attr' => array('class' => "form-control"),
            'label' => 'form.current_password',
            'translation_domain' => 'FOSUserBundle',
            'mapped' => false,
        ));
    }

    public function getParent()
    {
        return 'fos_user_profile';
    }

    public function getName()
    {
        return 'app_user_profile';
    }
}