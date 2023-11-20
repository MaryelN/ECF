<?php

namespace App\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class EmailsController extends AbstractController
{
    #[Route('/emails', name: 'app_emails')]
    public function index(): Response
    {
        return $this->render('emails/index.html.twig', [
            'controller_name' => 'EmailsController',
        ]);
    }
}
