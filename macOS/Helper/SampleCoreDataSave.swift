//
//  SampleCoreDataSave.swift
//  Cashdeck
//
//  Created by Syahrul Apple Developer BINUS on 02/08/21.
//

import SwiftUI

struct SampleCoreDataSave: View {
    
    @Environment(\.managedObjectContext) var contextSample
    
    // Fetching Data ...
    @FetchRequest(entity: Alias.entity(), sortDescriptors: [NSSortDescriptor(key: "date", ascending: true)], animation: .spring()) var aliasTable : FetchedResults<Alias>
    
    var body: some View {
        ScrollView {
            Button(action: {
                let alias = Alias(context: contextSample)
                alias.sku = "SKU123"
                alias.product_id = "123"
                alias.name_alias = "Barang Ilegal"
                
//                try! contextSample.save()
//                print("Saving Core Data")
                
                for item in aliasTable {
                    print(item.name_alias)
                }
                
            }, label: {
                Text("Save Data")
            })
        }
        
    }
}

struct SampleCoreDataSave_Previews: PreviewProvider {
    static var previews: some View {
        SampleCoreDataSave()
    }
}
