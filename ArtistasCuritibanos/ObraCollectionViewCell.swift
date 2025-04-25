import UIKit

// Célula personalizada para exibir uma obra no grid
class ObraCollectionViewCell: UICollectionViewCell {
    static let identifier = "ObraCollectionViewCell"

    let imagemView: UIImageView = {
        let img = UIImageView()
        img.contentMode = .scaleAspectFill
        img.clipsToBounds = true
        return img
    }()

    let tituloLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.numberOfLines = 1
        return label
    }()

    let artistaLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = .darkGray
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)

        // Layout com stack vertical: imagem, título e artista
        let stack = UIStackView(arrangedSubviews: [imagemView, tituloLabel, artistaLabel])
        stack.axis = .vertical
        stack.spacing = 4
        contentView.addSubview(stack)

        stack.translatesAutoresizingMaskIntoConstraints = false
        imagemView.heightAnchor.constraint(equalTo: contentView.widthAnchor).isActive = true

        NSLayoutConstraint.activate([
            stack.topAnchor.constraint(equalTo: contentView.topAnchor),
            stack.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            stack.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            stack.bottomAnchor.constraint(lessThanOrEqualTo: contentView.bottomAnchor)
        ])
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // Método para configurar a célula com os dados da obra
    func configure(with obra: ObraDeArte) {
        imagemView.image = UIImage(named: obra.imagemNome)
        tituloLabel.text = obra.titulo
        artistaLabel.text = obra.artista
    }
}
