<?php

namespace App\Controller;

use App\Entity\Event;
use App\Form\EventType;
use App\Repository\EventRepository;
use App\Service\FileUploader;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Attribute\Route;

#[Route('/event')]
class EventController extends AbstractController
{
    #[Route('/', name: 'app_event_index', methods: ['GET'])]
    public function index(EventRepository $eventRepository): Response
    {
        return $this->render('event/index.html.twig', [
            'events' => $eventRepository->findAll(),
        ]);
    }

    #[Route('/new', name: 'app_event_new', methods: ['GET', 'POST'])]
    public function new(Request $request, FileUploader $fileUploader, EntityManagerInterface $entityManager): Response
    {
        $event = new Event();
        $form = $this->createForm(EventType::class, $event);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $picture = $form->get('picture')->getData(); //picture come> AnimalType.php 
            if ($picture) {
                $pictureName = $fileUploader->upload($picture);
                $event->setPicture($pictureName);
            } // entity>Animal.php is setPicture
            else {
                $event->setPicture("picture.jpg");
            } // default pic if user don't select pic 
            $entityManager->persist($event);
            $entityManager->flush();

            return $this->redirectToRoute('app_event_index', [], Response::HTTP_SEE_OTHER);
        }

        return $this->render('event/new.html.twig', [
            'event' => $event,
            'form' => $form,
        ]);
    }

    #[Route('/{id}', name: 'app_event_show', methods: ['GET'])]
    public function show(Event $event): Response
    {
        return $this->render('event/show.html.twig', [
            'event' => $event,
        ]);
    }


    #[Route('/type/{eventType}', name: 'app_event_filter_by_type', methods: ['GET'])]
    public function filterByType(string $eventType, EventRepository $eventRepository): Response
    {
        // Fetch events from the repository based on the provided type
        $events = $eventRepository->findBy(['type' => $eventType]);

        return $this->render('event/index.html.twig', [
            'events' => $events,
        ]);
    }




    #[Route('/{id}/edit', name: 'app_event_edit', methods: ['GET', 'POST'])]
    public function edit(Request $request, Event $event, EntityManagerInterface $entityManager, FileUploader $fileUploader): Response
    {
        $form = $this->createForm(EventType::class, $event);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $picture = $form->get('picture')->getData();
            if ($picture) {
                if ($event->getPicture() != 'picture.jpg') {
                    unlink($this->getParameter('pictures_directory') . '/' . $event->getPicture());
                }
                $pictureName = $fileUploader->upload($picture);
                $event->setPicture($pictureName);
            }
            $entityManager->flush();
            return $this->redirectToRoute('app_event_index', [], Response::HTTP_SEE_OTHER);
        }

        return $this->render('event/edit.html.twig', [
            'event' => $event,
            'form' => $form,
        ]);
    }


    #[Route('/{id}', name: 'app_event_delete', methods: ['POST'])]
    public function delete(Request $request, Event $event, EntityManagerInterface $entityManager): Response
    {
        if ($this->isCsrfTokenValid('delete' . $event->getId(), $request->getPayload()->get('_token'))) {
            $entityManager->remove($event);
            $entityManager->flush();
            if ($event->getPicture() != 'picture.jpg') // hat entity w hat menha picture if the user doesn't insert pic it will be the default picture so use unlink to delete it 
            {
                unlink($this->getParameter('pictures_directory') . '/' . $event->getPicture());
            }
        }

        return $this->redirectToRoute('app_event_index', [], Response::HTTP_SEE_OTHER);
    }
}
