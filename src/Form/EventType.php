<?php

namespace App\Form;

use App\Entity\Event;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\Extension\Core\Type\ChoiceType;
use Symfony\Component\Form\Extension\Core\Type\FileType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;
use Symfony\Component\Validator\Constraints\File;

class EventType extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options): void
    {
        $builder
            ->add('name', null,  ['attr' => ['class' => 'form-control', 'placeholder' => 'Event name'],])
            ->add('description', null,  ['attr' => ['class' => 'form-control', 'placeholder' => 'decription'],])
            ->add('capacity', null,  ['attr' => ['class' => 'form-control', 'placeholder' => 'insert max capacity of people'],])
            ->add('contact_email', null,  ['attr' => ['class' => 'form-control', 'placeholder' => 'please insert valid email'],])
            ->add('contact_number', null,  ['attr' => ['class' => 'form-control', 'placeholder' => 'please insert valid contact number'],])
            ->add('address', null,  ['attr' => ['class' => 'form-control', 'placeholder' => 'please insert the Event location'],])
            ->add('url', null,  ['attr' => ['class' => 'form-control', 'placeholder' => 'Url for event if possible'],])
            ->add('type', ChoiceType::class, [
                'choices' => [
                    'Music' => 'music',
                    'Sport' => 'sport',
                    'Movie' => 'movie',
                    'Theater' => 'theater'
                ],
                'attr' => ['class' => 'form-control', 'placeholder' => 'Select event type']
            ])
            ->add('dateTime', null, [
                'widget' => 'single_text'
            ])


            ->add('picture', FileType::class, [
                'label' => 'Picture (jpg,png,jpeg file)', //picture:column name
                'attr' =>  ['class' => 'form-control'], // to style by bootstrap
                'mapped' => false,
                'required' => false,  //don't force to upload pic, if True you force the user to insert image
                'constraints' => [
                    new File([
                        'maxSize' => '1024k',
                        'mimeTypes' => ['image/jpg', 'image/png', 'image/jpeg'],
                        'mimeTypesMessage' => 'Please upload a valid image',
                    ])
                ],
            ]);
    }

    public function configureOptions(OptionsResolver $resolver): void
    {
        $resolver->setDefaults([
            'data_class' => Event::class,
        ]);
    }
}
