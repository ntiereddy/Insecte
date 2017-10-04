<?php

namespace AppBundle\Controller;

use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;
use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\Security\Core\Exception\AccessDeniedException;
use FOS\UserBundle\Model\UserInterface;
use AppBundle\Entity\User;
use AppBundle\Form\EditFriendType;

class DefaultController extends Controller
{
    /**
     * @Route("/", name="homepage")
     */
    public function indexAction(Request $request)
    {
        $user = $this->container->get('security.context')->getToken()->getUser();

        if (!is_object($user) || !$user instanceof UserInterface) {
            throw new AccessDeniedException('This user does not have access to this section.');
        } else {
            return $this->redirectToRoute('fos_user_profile_show');
        }
    }

    /**
     * @Route("/friends", name="friends_page")
     */
    public function friendsAction(Request $request)
    {
        $user = $this->container->get('security.context')->getToken()->getUser();

        if (!is_object($user) || !$user instanceof UserInterface) {
            throw new AccessDeniedException('This user does not have access to this section.');
        } else {
            // On récupère la liste d'insecte
            $users = $this->container->get('security.context')->getToken()->getUser()->getMyFriends();
            
            return $this->render('default/friends.html.twig', array("users" => $users));
        }
    }

    /**
     * @Route("/friends/friend/{id}", name="friend_infos_page")
     */
    public function friendInfos(Request $request)
    {
        $user = $this->container->get('security.context')->getToken()->getUser();

        if (!is_object($user) || !$user instanceof UserInterface) {
            throw new AccessDeniedException('This user does not have access to this section.');
        } else {
            // On récupère l'id de l'insecte depuis notre URL
            $request = $this->getRequest();
            $id = (int)$request->attributes->get('id');

            // On récupère la liste d'amis de l'utilisateur
            $friends_list = $this->container->get('security.context')->getToken()->getUser()->getMyFriends();

            // Tester si l'insecte figure dans la liste d'insecte
            foreach ($friends_list as $ami) 
            {
                // Si oui, traitement normal
                if ($ami->getId() == $id) 
                {
                    // On récupère l'insecte à partir de son id
                    $repository = $this->getDoctrine()->getRepository('AppBundle:User');
                    $friend = $repository->find($id);

                    return $this->render('default/friend_info.html.twig', array("friend" => $friend));
                } 
            }

            //Sinon, redirection vers la page d'insecte
            return $this->redirectToRoute('friends_page');
        }
    }

    /**
     * @Route("/friends/unfriend/{id}", name="unfriend")
     */
    public function deleteFriend(Request $request)
    {
        $user = $this->container->get('security.context')->getToken()->getUser();

        if (!is_object($user) || !$user instanceof UserInterface) {
            throw new AccessDeniedException('This user does not have access to this section.');
        } else {
            // On récupère l'id de l'insecte depuis notre URL
            $request = $this->getRequest();
            $id = (int)$request->attributes->get('id');

            // On récupère l'insecte à partir de son id
            $repository = $this->getDoctrine()->getRepository('AppBundle:User');
            $friend = $repository->find($id);

            // On le supprime de la liste d'insectes
            $response = $user->removeMyFriend($friend);

            // On récupère l'EntityManager
            $em = $this->getDoctrine()->getManager();

            // On « flush » tout ce qui a été persisté avant
            $em->flush();

            // On redirige vers la page d'insecte
            return $this->redirectToRoute('friends_page');
        }
    }

    /**
     * @Route("/find_friends", name="find_friends")
     */
    public function findFriends(Request $request)
    {
        $user = $this->container->get('security.context')->getToken()->getUser();

        if (!is_object($user) || !$user instanceof UserInterface) {
            throw new AccessDeniedException('This user does not have access to this section.');
        } else {

            // On récupère la liste de tous les insectes sauf celui online
            $em = $this->getDoctrine()->getManager();
            $query = $em->createQuery(
                'SELECT u
                FROM AppBundle:User u
                WHERE u.id <> :id'
            )->setParameter('id', $this->container->get('security.context')->getToken()->getUser()->getId());
            $list = $query->getResult();
            
            return $this->render('default/find_friends.html.twig', array("users" => $list));
        }
    }

    /**
     * @Route("/friends/add_friend/{id}", name="add_friend")
     */
    public function addFriend(Request $request)
    {
        $user = $this->container->get('security.context')->getToken()->getUser();

        if (!is_object($user) || !$user instanceof UserInterface) {
            throw new AccessDeniedException('This user does not have access to this section.');
        } else {
            // On récupère l'id de l'insecte depuis notre URL
            $request = $this->getRequest();
            $id = (int)$request->attributes->get('id');

            // On récupère l'insecte à partir de son id
            $repository = $this->getDoctrine()->getRepository('AppBundle:User');
            $friend = $repository->find($id);

            // On test si l'insecte figure déjà dans la liste d'amis de l'utilisateur
            $friends_list = $this->container->get('security.context')->getToken()->getUser()->getMyFriends();

            $exists = false;
            foreach ($friends_list as $ami) 
            {
                if ($ami->getId() == $id)
                {
                    $exists = true;
                }
            }

            if (!$exists)
            {
                // On l'ajoute à la liste d'insecte
                $response = $user->addMyFriend($friend);

                // On récupère l'EntityManager
                $em = $this->getDoctrine()->getManager();

                // On « persiste » l'entité
                $em->persist($response);

                // On « flush » tout ce qui a été persisté avant
                $em->flush();
            }
            
            // On redirige vers la page d'insecte
            return $this->redirectToRoute('friends_page');
        }
    }

    /**
     * @Route("/friends/friend/{id}/edit", name="edit_friend")
     */
    public function editFriendInfos(/*Request $request*/)
    {
        $request = $this->get('request');
        $user = $this->container->get('security.context')->getToken()->getUser();

        if (!is_object($user) || !$user instanceof UserInterface) {
            throw new AccessDeniedException('This user does not have access to this section.');
        } else { 
            // On récupère l'id de l'insecte depuis notre URL
            $request = $this->getRequest();
            $id = (int)$request->attributes->get('id');

            // On récupère l'insecte à partir de son id
            $repository = $this->getDoctrine()->getRepository('AppBundle:User');
            $friend = $repository->find($id);

            $form = $this->get('form.factory')->create(new EditFriendType(), $friend, array( 
                    'action' => $request->getUri(),
                )
            );

            if($this->getRequest()->getMethod() == 'POST') {
                $form->bind($this->getRequest());
                     
                if($form->isValid()) 
                {
                    // On récupère l'EntityManager
                    $em = $this->getDoctrine()->getManager();

                    // On « flush » tout ce qui a été persisté avant
                    $em->flush();

                    // On envoi une 'flash' pour indiquer à l'utilisateur que le bureau est ajouté
                    //$this->get('session')->getFlashBag()->add('notice', 'Modifié');

                    return $this->redirectToRoute('friends_page');
                }
            }

            return $this->render('default/edit_friend_info.html.twig', array('form' => $form->createView(), 'friend' => $friend));
        }
        //}
    }
}
