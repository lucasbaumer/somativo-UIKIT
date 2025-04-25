import UIKit

// Tela de detalhes de uma obra de arte selecionada
// Exibe imagem, título, artista, ano, estilo, descrição e botão para compartilhar
class DetalhesObraViewController: UIViewController {

    let obra: ObraDeArte

    init(obra: ObraDeArte) {
        self.obra = obra
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = obra.titulo

        // Uso de UIScrollView para permitir rolagem do conteúdo em telas pequenas
        let scrollView = UIScrollView()
        let contentView = UIView()
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)

        scrollView.translatesAutoresizingMaskIntoConstraints = false
        contentView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),

            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor) // evita rolagem horizontal
        ])

        // Elementos visuais da obra
        let imagem = UIImageView(image: UIImage(named: obra.imagemNome))
        imagem.contentMode = .scaleAspectFit

        let titulo = UILabel()
        titulo.text = obra.titulo
        titulo.font = .boldSystemFont(ofSize: 22)

        let artista = UILabel()
        artista.text = "Por \(obra.artista)"

        let ano = UILabel()
        ano.text = "Ano: \(obra.ano)"

        let estilo = UILabel()
        estilo.text = "Estilo: \(obra.estilo)"

        let descricao = UILabel()
        descricao.text = obra.descricao
        descricao.numberOfLines = 0

        let botaoCompartilhar = UIButton(type: .system)
        botaoCompartilhar.setTitle("Compartilhar", for: .normal)
        botaoCompartilhar.addTarget(self, action: #selector(compartilhar), for: .touchUpInside)

        // Organização vertical com espaçamento entre os elementos
        let stack = UIStackView(arrangedSubviews: [imagem, titulo, artista, ano, estilo, descricao, botaoCompartilhar])
        stack.axis = .vertical
        stack.spacing = 12

        contentView.addSubview(stack)
        stack.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            stack.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            stack.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            stack.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            stack.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20)
        ])
    }

    // Ação do botão Compartilhar
    @objc func compartilhar() {
        let texto = "\(obra.titulo) por \(obra.artista). Conheça mais artistas curitibanos!"
        let atividade = UIActivityViewController(activityItems: [texto], applicationActivities: nil)
        present(atividade, animated: true)
    }
}
