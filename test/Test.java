
import java.util.List;
import java.util.Set;
import poly.core.common.CoreConstant;
import poly.core.dao.impl.CategoryDaoImpl;
import poly.core.persistence.entity.Category;

public class Test {

    public static void main(String[] args) {
        List<Category> list = new CategoryDaoImpl().getRootCategory();
        for (Category category : list) {
            System.out.println(category.getName());
            Set<Category> child = category.getChildCategories();
            for (Category cateChild : child) {
                System.out.println("----" + cateChild.getName());
            }
        }
    }

}
