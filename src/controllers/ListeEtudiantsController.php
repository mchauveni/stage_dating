<?php

namespace App\Controllers;

use Service\Routes\Response;
use Service\Interfaces\Controller;
use Templates\Views;

use App\Service\FPDF;
use Service\Database\Entities\Formation;
use Service\Routes\ErrorResponse;

class ListeEtudiantsController extends Controller
{
    public function listeEtud(): Response
    {
        $user = $user = (new LoginController())->auth();

        if ($user["isResp"]) {
            $etudiants = (new Formation())->getAllEtudiants($user["id_formation"]);

            if(isset($this->getRequest()->get["pdf"])) {
                return $this->pdf($user, $etudiants);
            }

            return Response::template(Views\Responsable\listeEtudiants::class, [
                "etudiants" => $etudiants,
                "user" => $user,
                "title" => "Liste étudiants {$user['nom_BUT']} {$user['annee_BUT']}"
            ]);
        } else {
            return new ErrorResponse(403);
        }
    }

    public function pdf (array $user, array $etudiants) : string {
        date_default_timezone_set("Europe/Paris");
        $time = date("d/m/Y H:i");
        $pdf = new FPDF();
        $pdf->AddPage();

        $pdf->SetFont('helvetica','B',16);
        $pdf->Cell(0,10, iconv("UTF-8", "", "Liste des étudiants pour formation {$user['nom_BUT']} {$user['annee_BUT']}"), 0, 0, 'center');
        $pdf->SetFont('helvetica','I',14);
        $pdf->Ln(10);
        $pdf->Cell(0,10,iconv("UTF-8", "", "Responsable de stage: {$user['nom_resp_stage']} {$user['prenom_resp_stage']}"), 0, 0, 'center');
        $pdf->Ln(13);

        $pdf->SetFont('helvetica','',10);
        $cells = [];
        $cellsSize = [];

        $cellMaxSize = $pdf->GetPageWidth()/4 - ($pdf->GetX()/2) - 40;

        $cells[] = [
            "Nom/prénom étudiant",
            "Email étudiant",
            "Tél étudiant",
            "Nombre \n\n d'entretiens"
        ];

        $cellsSize[] = [
            $pdf->GetStringWidth(end($cells)[0]),
            $pdf->GetStringWidth(end($cells)[1]),
            $pdf->GetStringWidth(end($cells)[2]),
            $pdf->GetStringWidth(end($cells)[3])
        ];

        foreach($etudiants as $etudiant) {
            $cells[] = [
                "{$etudiant['nom_etudiant']} {$etudiant['prenom_etudiant']}",
                $etudiant['email_etudiant'],
                $etudiant['tel_etudiant'],
                $etudiant['nb_entretiens']
            ];

            $cellsSize[] = [
                $pdf->GetStringWidth(end($cells)[0]),
                $pdf->GetStringWidth(end($cells)[1]),
                $pdf->GetStringWidth(end($cells)[2]),
                $pdf->GetStringWidth(end($cells)[3])
            ];
        }

        foreach($cells as $cell) {
            foreach($cell as $id => $output) {
                $arr = array_column($cellsSize, $id);
                sort($arr);
                $size = end($arr) + 10;
                $pdf->Cell($size,10,iconv("UTF-8", "", $output), 1, 0, 'C');
            }
            $pdf->Ln(10);
        }

        $text = "{$user['nom_resp_stage']} {$user['prenom_resp_stage']} | {$user['nom_BUT']} {$user['annee_BUT']}";
        $pdf->Text($pdf->GetPageWidth() - $pdf->GetStringWidth($text) - 12, $pdf->GetPageHeight() - 12, $text);
        return $pdf->Output('', "Liste Etudiants - {$user['nom_BUT']} {$user['annee_BUT']} [{$time}]");
    }
}
