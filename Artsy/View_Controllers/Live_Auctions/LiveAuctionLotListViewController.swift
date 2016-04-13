import UIKit
import Interstellar


class LiveAuctionLotListViewController: UICollectionViewController {
    let lots: [LiveAuctionLotViewModelType]
    let currentLotSignal: Signal<LiveAuctionLotViewModelType>
    let stickyCollectionViewLayout: LiveAuctionLotListStickyCellCollectionViewLayout

    init(lots: [LiveAuctionLotViewModelType], currentLotSignal: Signal<LiveAuctionLotViewModelType>) {
        self.lots = lots
        self.currentLotSignal = currentLotSignal
        self.stickyCollectionViewLayout = LiveAuctionLotListStickyCellCollectionViewLayout()

        super.init(collectionViewLayout: self.stickyCollectionViewLayout)

        currentLotSignal.next { [weak self] lot in
            self?.stickyCollectionViewLayout.setActiveIndex(lot.lotIndex - 1) // Remember, lot indices are one-indexed
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        return nil
    }

    override func viewDidLoad() {
        collectionView?.backgroundColor = .whiteColor()

        collectionView?.registerClass(LotListCollectionViewCell.self, forCellWithReuseIdentifier: LotListCollectionViewCell.CellIdentifier)
    }
}


private typealias CollectionView = LiveAuctionLotListViewController
extension CollectionView {
    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return lots.count
    }

    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(LotListCollectionViewCell.CellIdentifier, forIndexPath: indexPath)

        // TODO: Customize

        return cell
    }
}


