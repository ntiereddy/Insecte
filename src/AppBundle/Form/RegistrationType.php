<?php
// src/AppBundle/Form/RegistrationType.php

namespace AppBundle\Form;

use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\FormBuilderInterface;

class RegistrationType extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options)
    {
        $builder
            ->add('username', null, array('attr' => array('class' => "form-control"), 'label' => 'Nom insecte', 'translation_domain' => 'FOSUserBundle'))
            ->add('email', 'email', array('attr' => array('class' => "form-control"), 'label' => 'form.email', 'translation_domain' => 'FOSUserBundle'))
            ->add('plainPassword', 'repeated', array(
                'type' => 'password',
                'options' => array('translation_domain' => 'FOSUserBundle'),
                'first_options' => array('attr' => array('class' => "form-control"), 'label' => 'form.password'),
                'second_options' => array('attr' => array('class' => "form-control"), 'label' => 'form.password_confirmation'),
                'invalid_message' => 'fos_user.password.mismatch',
            ))
        ;
        $builder->add('age', null, array('attr' => array('class' => "form-control"), 'label' => 'Age'));
        $builder->add('family', null, array('attr' => array('class' => "form-control"), 'label' => 'Famille'));
    }

    public function getParent()
    {
        return 'fos_user_registration';
    }

    public function getName()
    {
        return 'app_user_registration';
    }
}