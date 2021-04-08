//
//  TermsView.swift
//  SignInForm
//
//  Created by Barış Özübal on 25.02.2021.
//

import SwiftUI

struct TermsView: View {
    @Environment(\.presentationMode) var presentationMode:Binding<PresentationMode>
    @Binding var acceptedTerms: Bool
    
    let termsAndConditionsText = """
    Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut interdum ante ut urna luctus, ac fringilla urna viverra. Donec in eros lobortis, lacinia lorem at, faucibus lorem. Praesent lobortis porttitor ante eget commodo. Nullam a neque interdum, sagittis erat sit amet, auctor arcu. Aliquam aliquet, nulla at euismod fermentum, ex dolor semper libero, maximus aliquam mi odio id augue. Sed lorem ex, volutpat et dui et, semper gravida nibh. Maecenas blandit ligula in porta vulputate. Praesent ac augue fringilla, fringilla velit quis, efficitur nisl. Nam mattis, dui vel dictum consequat, sapien sapien aliquam turpis, vel finibus sapien justo at turpis. Suspendisse viverra scelerisque mi, vitae facilisis quam feugiat eu. Phasellus suscipit, lectus vel iaculis ultrices, velit magna euismod diam, id semper augue ante ac eros. Fusce non egestas ipsum, id consectetur justo. Vestibulum ac arcu ut neque dictum porttitor.

    Integer et lacinia metus, quis placerat ante. Maecenas scelerisque luctus erat, quis tristique tellus cursus nec. In sed varius dolor. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec egestas magna dui, vitae efficitur tellus tincidunt a. Nam ultrices ultricies justo. Aenean felis ipsum, sagittis eget congue nec, sodales non erat. Praesent congue vel diam at interdum. Mauris id nunc vitae nisi finibus accumsan sed in massa. Nulla vel turpis augue. Aliquam erat volutpat. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Ut malesuada metus vel metus viverra, vitae suscipit ex facilisis. Vivamus vitae enim quis tortor interdum molestie. Nunc vel augue nec nibh ullamcorper hendrerit suscipit sit amet eros. Nullam at enim sit amet ligula venenatis ullamcorper non ut nulla.

    Aenean felis erat, hendrerit vel tortor ac, interdum vulputate urna. Aliquam erat volutpat. Fusce ligula massa, blandit eget elit vel, gravida viverra neque. Quisque ut risus condimentum, tempus felis id, dapibus erat. Morbi venenatis lorem id libero vehicula, vehicula aliquam mi efficitur. Donec fringilla orci pulvinar eleifend mollis. Pellentesque luctus sapien eget neque aliquet hendrerit. Maecenas eu mauris diam. Ut tincidunt leo nec mauris posuere, pretium rutrum neque luctus. Etiam convallis interdum tempus. Sed accumsan ornare volutpat. Pellentesque sit amet ante sit amet enim aliquet placerat. Nam nec consectetur mi. Integer facilisis quam ut tortor dapibus, eu feugiat quam aliquet.

    Donec aliquam varius mauris vel faucibus. Nam a nibh eu urna pulvinar interdum. Pellentesque sagittis ut erat quis accumsan. Nunc eu consectetur velit. Integer lobortis felis quis augue consequat imperdiet. In fringilla ac libero nec vulputate. Sed non lectus quis ex convallis imperdiet.

    Pellentesque a neque in odio vestibulum dapibus eget sed nibh. Proin leo ipsum, tristique non laoreet vitae, porttitor non diam. Praesent dictum semper sem, id suscipit purus pretium id. Nulla ut lacus dapibus, efficitur dolor vel, posuere risus. Vivamus id quam elit. Nunc sit amet vehicula tortor. Vivamus sit amet nibh a erat facilisis blandit non laoreet quam. Praesent non semper nisl, a tincidunt enim. Donec mattis, tellus vitae cursus vestibulum, enim ipsum porta massa, sit amet pretium arcu libero sed felis. Integer auctor orci eget velit aliquam molestie. Integer non quam rutrum, consectetur dui sit amet, tristique tortor. Praesent quis sapien eget magna consectetur pretium sed vel elit. Quisque dolor mauris, tincidunt nec diam nec, vestibulum molestie velit. Morbi quis odio et augue fermentum euismod. Phasellus sed volutpat dolor.
    """
    
    var body: some View {
        NavigationView {
            ScrollView {
                Text(termsAndConditionsText)
                    .padding()
            }
            .navigationBarTitle(Text("Terms & Conditions"), displayMode: .inline)
            .navigationBarItems( leading: Button(action: { presentationMode.wrappedValue.dismiss() }) { Text("Cancel") }, trailing: Button(action: { acceptedTerms = true; presentationMode.wrappedValue.dismiss() }) { Text(acceptedTerms ? "Accepted" : "Accept") }.disabled(acceptedTerms) )
        }
    }
}

struct TermsView_Previews: PreviewProvider {
    static var previews: some View {
        TermsView(acceptedTerms: .constant(false))
    }
}


