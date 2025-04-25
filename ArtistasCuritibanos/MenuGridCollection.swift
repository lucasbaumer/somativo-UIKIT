import UIKit

// Tela inicial da galeria, exibindo as obras em formato grid
class MenuGridCollection: UICollectionViewController, UICollectionViewDelegateFlowLayout {

    // Lista de obras fixas - poderia futuramente vir de uma API ou banco de dados local
    let obras: [ObraDeArte] = [
        ObraDeArte(
            titulo: "O Circo",
            artista: "Poty Lazzarotto",
            ano: 1958,
            estilo: "Gravura / Modernismo",
            imagemNome: "o_circo", // nome da imagem no Assets.xcassets
            descricao: "Uma de suas obras mais conhecidas, retrata com sensibilidade o universo do circo e suas figuras marginais."
        ),
        ObraDeArte(
            titulo: "O Largo da Ordem",
            artista: "Poty Lazzarotto",
            ano: 1993,
            estilo: "Painel",
            imagemNome: "largo_ordem",
            descricao: "O painel apresenta a cidade na época em que os imigrantes vinham em carroças para vender produtos no Largo da Ordem"
        ),
        ObraDeArte(
            titulo: "Imagens da Cidade",
            artista: "Poty Lazzarotto",
            ano: 1996,
            estilo: "Painel",
            imagemNome: "imagens_cidade",
            descricao: "o painel Imagens da Cidade apresenta a Curitiba atual. A obra busca resumir a história da cidade através deste contraste entre o passado e a atualidade."
        ),
        ObraDeArte(
            titulo: "Natureza-morta no Quintal da Minha Mãe",
            artista: "Regina Vater",
            ano: 1988,
            estilo: "Oleo sobre tela",
            imagemNome: "natureza_morta",
            descricao: "Um retrato sobre a natureza morta que havia no quintal de sua mae."
        ),
        ObraDeArte(
            titulo: "Casario",
            artista: "Regina Vater",
            ano: 1964,
            estilo: "Oleo sobre papel",
            imagemNome: "casario",
            descricao: "A obra Casario de Regina Vater é uma representação visual que explora o ambiente urbano e a memória arquitetônica brasileira, com destaque para a atmosfera dos bairros antigos e históricos."
        ),
        ObraDeArte(
            titulo: "Galos em briga",
            artista: "Fernando Velloso",
            ano: 1957,
            estilo: "Abstrato Contemporâneo",
            imagemNome: "galos_briga",
            descricao: ", é uma pintura vibrante e expressiva que retrata o confronto entre galos de forma simbólica e carregada de movimento."
        ),
        ObraDeArte(
            titulo: "Homem sem caminho",
            artista: "Guido Viaro",
            ano: 1940,
            estilo: "Expressionismo",
            imagemNome: "homem_caminho",
            descricao: "Uma obra expressionista que retrata um homem solitário e perdido, refletindo a angústia existencial e a falta de direção na vida. Com traços fortes e tons escuros, Guido Viaro transmite a dor humana de forma intensa e poética."
        ),
        ObraDeArte(
            titulo: "Pipa Price",
            artista: "Gustavo von Ha",
            ano: 2021,
            estilo: "Arte Contemporanea",
            imagemNome: "pipa_price",
            descricao: "Uma crítica visual ao consumismo, a obra mistura o símbolo da pipa com um etiquetador de preços, questionando o valor da liberdade em uma sociedade onde tudo parece ter um preço."
        ),
        ObraDeArte(
            titulo: "No bar",
            artista: "Luiz Carlos de Andrade Lima",
            ano: 1983,
            estilo: "Arte Urbana expressiva",
            imagemNome: "no_bar",
            descricao: "Com cores fortes e traços expressivos, a obra retrata um típico momento de bar em Curitiba, capturando a simplicidade, a boemia e o calor humano do cotidiano urbano."
        ),
        ObraDeArte(
            titulo: "Santa ceia",
            artista: "Luiz Carlos de Andrade Lima",
            ano: 1980,
            estilo: "Figurativismo Expressionista",
            imagemNome: "santa_ceia",
            descricao: "Entalhe em madeira que retrata a Última Ceia com expressividade e emoção, destacando a abordagem única de Andrade Lima sobre temas religiosos."
        )
    ]
    
    override func viewDidLoad() {
            super.viewDidLoad()
            title = "Galeria de Artistas Curitibanos"
            collectionView.backgroundColor = .systemBackground

            // Registro da célula personalizada
            self.collectionView.register(ObraCollectionViewCell.self, forCellWithReuseIdentifier: ObraCollectionViewCell.identifier)
        }

        // Define o número de itens (obras) no grid
        override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return obras.count
        }

        // Configura cada célula com os dados da obra
        override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            let obra = obras[indexPath.item]
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ObraCollectionViewCell.identifier, for: indexPath) as! ObraCollectionViewCell
            cell.configure(with: obra)
            return cell
        }

        // Ação ao tocar em uma obra — leva à tela de detalhes
        override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
            let obraSelecionada = obras[indexPath.item]
            let detalhesVC = DetalhesObraViewController(obra: obraSelecionada)
            navigationController?.pushViewController(detalhesVC, animated: true)
        }
    }

