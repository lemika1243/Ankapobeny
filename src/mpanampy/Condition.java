package mpanampy;

import java.util.List;

public class Condition {
    String comparaison = "=", operation = "and";
    String key;
    Object value;
    public Condition() {}
    public Condition(String key, String comparaison, Object value, String operation) {
        this.comparaison = comparaison;
        this.operation = operation;
        this.key = key;
        this.value = value;
    }
    public Condition(String key, String comparaison, Object value) {
        this.comparaison = comparaison;
        this.key = key;
        this.value = value;
    }
    public Condition(String key, Object value) {
        this.key = key;
        this.value = value;
    }
    public String getComparaison() {
        return comparaison;
    }
    public void setComparaison(String comparaison) {
        this.comparaison = comparaison;
    }
    public String getOperation() {
        return operation;
    }
    public void setOperation(String operation) {
        this.operation = operation;
    }
    public String getKey() {
        return key;
    }
    public void setKey(String key) {
        this.key = key;
    }
    public Object getValue() {
        return value;
    }
    public void setValue(Object value) {
        this.value = value;
    }

    /**
     * Builds a SQL condition string for PreparedStatement placeholders.
     *
     * @param conditions The list of Condition objects.
     * @return The constructed SQL condition string.
     * @throws Exception If the list is null or empty.
     */
    public static String buildConditionString(List<Condition> conditions) throws Exception {
        if (conditions == null || conditions.isEmpty()) {
            throw new Exception("Conditions list cannot be null or empty");
        }

        StringBuilder conditionBuilder = new StringBuilder();

        for (int i = 0; i < conditions.size(); i++) {
            Condition condition = conditions.get(i);

            // Append the key, comparison operator, and placeholder
            conditionBuilder.append(condition.getKey())
                            .append(" ")
                            .append(condition.getComparaison())
                            .append(" ?");

            // Append the logical operation unless it's the last condition
            if (i < conditions.size() - 1) {
                conditionBuilder.append(" ")
                                .append(condition.getOperation())
                                .append(" ");
            }
        }

        return conditionBuilder.toString();
    }
}
