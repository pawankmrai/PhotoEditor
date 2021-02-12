import UIKit

public protocol ColorPickerDelegate {
    func selected(color: UIColor)
}

public class AppColorPickerViewController: UIViewController {
    // MARK: Private
    private var collectionView: UICollectionView!
    private var colors: [String] = ColorPalette.items
    
    // MARK: Public
    public var colorPickerDelegate: ColorPickerDelegate?
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        prepareView()
        prepareConstraints()
    }
    
    private func prepareView() {
        //
        view.backgroundColor = .white
        //
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 10, left: 5, bottom: 5, right: 5)
        layout.itemSize = CGSize(width: 30, height: 30)
        
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView?.dataSource = self
        collectionView?.delegate = self
        collectionView?.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "ColorCell")
        collectionView?.backgroundColor = UIColor.white
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.showsVerticalScrollIndicator = false
        collectionView.showsHorizontalScrollIndicator = false
        view.addSubview(collectionView)
    }
    
    func prepareConstraints() {
        //
        let layoutGuide = view.safeAreaLayoutGuide
        
        //
        collectionView.leadingAnchor.constraint(equalTo: layoutGuide.leadingAnchor).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: layoutGuide.trailingAnchor).isActive = true
        collectionView.topAnchor.constraint(equalTo: layoutGuide.topAnchor).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: layoutGuide.bottomAnchor).isActive = true
    }
}

extension AppColorPickerViewController: UICollectionViewDataSource {
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return colors.count
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let myCell = collectionView.dequeueReusableCell(withReuseIdentifier: "ColorCell", for: indexPath)
        myCell.backgroundColor = UIColor(hexString: colors[indexPath.row])
        return myCell
    }
}

extension AppColorPickerViewController: UICollectionViewDelegate {
    //
    public func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let color = UIColor(hexString: colors[indexPath.row])
        colorPickerDelegate?.selected(color: color)
        dismiss(animated: true)
    }
}
