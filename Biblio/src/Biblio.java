import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

class Auteur {
    private String nom;
    private String nationalite;

    // Constructeur par défaut 
    public Auteur() {
    }

    // Constructeur paramétré
    public Auteur(String nom, String nationalite) {
        this.nom = nom;
        this.nationalite = nationalite;
    }

    public void setNom(String nom) {
        this.nom = nom;
    }

    // Méthodes pour obtenir et définir chaque attribut
    public String getNom() {
        return (nom != null) ? nom : ""; 
    }

    public String getNationalite() {
        return nationalite;
    }

    public void setNationalite(String nationalite) {
        this.nationalite = nationalite;
    }


    public String toString() {
        return "Auteur{" +
                "nom='" + nom + '\'' +
                ", nationalite='" + nationalite + '\'' +
                '}';
    }
}

class BibliothequeException extends Exception {
    public BibliothequeException(String message) {
        super(message);
    }
}

abstract class Document {
    public abstract void afficherDetails();
}

final class Livre extends Document {
    private String titre;
    private Auteur auteur;
    private int anneePublication;
    private int nombrePages;

    // Constructeur par défaut 
    public Livre() {
        this("", new Auteur(), 0, 0);
    }

    // Constructeur paramétré 
    public Livre(String titre, Auteur auteur, int anneePublication, int nombrePages) {
        this.titre = titre;
        this.auteur = auteur;
        this.anneePublication = anneePublication;
        this.nombrePages = nombrePages;
    }

    // Méthodes pour obtenir
    public String getTitre() {
        return titre;
    }

    public void setTitre(String titre) {
        this.titre = titre;
    }

    public Auteur getAuteur() {
        return auteur;
    }

    public void setAuteur(Auteur auteur) {
        this.auteur = auteur;
    }

    public int getAnneePublication() {
        return anneePublication;
    }

    public void setAnneePublication(int anneePublication) {
        this.anneePublication = anneePublication;
    }

    public int getNombrePages() {
        return nombrePages;
    }

    public void setNombrePages(int nombrePages) {
        this.nombrePages = nombrePages;
    }

    public void afficherDetails() {
        System.out.println("Livre{" +
                "titre='" + titre  +
                ", auteur=" + auteur.getNom()+
                ", anneePublication=" + anneePublication +
                ", nombrePages=" + nombrePages +
                '}');
    }

    public String toString() {
        return "Livre{" +
                "titre='" + titre + '\'' +
                ", auteur=" + auteur +
                ", anneePublication=" + anneePublication +
                ", nombrePages=" + nombrePages +
                '}';
    }
}

class Bibliotheque {
    private List<Livre> livres;

    public Bibliotheque() {
        this.livres = new ArrayList<>();
    }

    // Methode pour ajouter un livre à la bibliothèque avec gestion d'exceptions
    public void ajouterLivre(Livre livre) throws BibliothequeException {
        if (livre.getAnneePublication() > LocalDate.now().getYear()) {
            throw new BibliothequeException(
                    "Année de publication future non autorisée pour le livre "+ livre.getTitre()  );

        }

        if (livre.getAuteur().getNom().isEmpty()) {
            throw new BibliothequeException("Le livre "  + livre.getTitre()+ " doit avoir un auteur ");

        }

        livres.add(livre);
    }

    // Méthode pour afficher tous les livres de la bibliothèque
    public void afficherLivres() {
        for (Livre livre : livres) {
            livre.afficherDetails();
        }
    }
}

public class Biblio {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);

        try {
            System.out.println("Ajout d'un nouvel auteur :");
            System.out.print("Entrez le nom de l'auteur : ");
            String nomAuteur = scanner.nextLine();
            System.out.print("Entrez la nationalité de l'auteur : ");
            String nationaliteAuteur = scanner.nextLine();

            Auteur auteur = new Auteur(nomAuteur, nationaliteAuteur);

            System.out.println("\nAjout d'un nouveau livre :");
            System.out.print("Entrez le titre du livre : ");
            String titreLivre = scanner.nextLine();
            System.out.print("Entrez l'année de publication du livre : ");
            int anneePublication = scanner.nextInt();
            System.out.print("Entrez le nombre de pages du livre : ");
            int nombrePages = scanner.nextInt();

            Livre livre = new Livre(titreLivre, auteur, anneePublication, nombrePages);

            Bibliotheque bibliotheque = new Bibliotheque();
            bibliotheque.ajouterLivre(livre);

            bibliotheque.afficherLivres();
        } catch (BibliothequeException e) {
            System.err.println("Erreur dans la bibliothèque : " + e.getMessage());
        } finally {
            scanner.close();
        }
    }
}